import 'dart:convert';

import 'package:deneme/Dtos/google_user_dto.dart';
import 'package:deneme/pages/client_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class CustomerService {
  final BuildContext _context;

  CustomerService({required BuildContext context}) : _context = context;

  Future<void> createMe(
      {required String firstName,
      required String lastName,
      required String email,
      required String dateOfBirth,
      required String phoneNumber}) async {
    final Uri url = Uri.parse('app.activite.tech/users');

    const storage = FlutterSecureStorage();

    await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Token-Provider': "Google",
          'Authorization': 'Bearer ${await storage.read(key: 'jwt')}',
        },
        body: jsonEncode({
          'id': Uuid().v4(),
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'googleId': await storage.read(key: 'googleId'),
          'dateOfBirth': dateOfBirth,
          'phoneNumber': phoneNumber,
          'region': 'TR',
        }));
  }

  Future<GoogleUserDto> getMe() async {
    const storage = FlutterSecureStorage();

    var meFromStorage = await storage.read(key: 'me');

    if (meFromStorage != null) {
      return GoogleUserDto.fromJson(meFromStorage);
    }

    final token = await storage.read(key: 'jwt');

    final Uri url = Uri.parse('app.activite.tech/users/me');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Token-Provider': "Google",
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var me = GoogleUserDto.fromJson(response.body);

      await storage.write(key: 'me', value: me.toJson().toString());

      return me;
    } else {
      throw Exception('Failed to load user');
    }
  }

  void navigateToClientHomePage() {
    Navigator.pushAndRemoveUntil(
      _context,
      MaterialPageRoute(builder: (context) => ClientHomePage()),
      (Route<dynamic> route) => false,
    );
  }

  Future<void> googleLogin() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );

      final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();

      if (googleAccount == null) {
        throw Exception('Kullanıcı giriş yapmayı iptal ett');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleAccount.authentication;
      final String accessToken = googleAuth.accessToken!;

      final String googleId = googleAccount.id;

      const storage = FlutterSecureStorage();

      await storage.write(key: 'googleId', value: googleId);
      await storage.write(key: 'jwt', value: accessToken);
    } catch (error) {
      dialogAndExit(_context, error.toString());
    }
  }

  void dialogAndExit(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Bir Hata Oluştu"),
          content: Text("Hata: ${error.toString()}"), // Hata mesajını göster
          actions: <Widget>[
            TextButton(
              child: const Text("Tamam"),
              onPressed: () {
                Navigator.of(context).pop(); // Popup'ı kapat
                Future.delayed(const Duration(milliseconds: 300), () {
                  // Uygulamayı kapat
                  SystemNavigator.pop();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
