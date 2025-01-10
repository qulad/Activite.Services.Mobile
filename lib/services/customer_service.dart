import 'dart:math';
import 'package:deneme/Dtos/google_user_dto.dart';
import 'package:deneme/pages/client_home_page.dart';
import 'package:deneme/utils/dateonly.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class CustomerService {

  Future<void> createMe(
      {required String firstName,
      required String lastName,
      required String email,
      required String dateOfBirth,
      required String phoneNumber}) async {

    const storage = FlutterSecureStorage();

      storage.write(key: 'me.firstName', value: firstName);
      storage.write(key: 'me.lastName', value: lastName);
      storage.write(key: 'me.email', value: email);
      storage.write(key: 'me.dateOfBirth', value: dateOfBirth);
      storage.write(key: 'me.phoneNumber', value: phoneNumber);
      storage.write(key: 'me.region', value: 'TR');

      await storage.write(key: 'me', value: {
        'id': const Uuid().v4(),
        'email': email,
        'phoneNumber': phoneNumber,
        'region': 'TR',
        'type': 'Customer',
        'termsAndServicesAccepted': false,
        'verified': false,
        'verificationCode': Random().nextInt(999999).toString(),
        'createdAt': DateTime.now().toIso8601String(),
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth,
        'googleId': await storage.read(key: 'googleId'),
      }.toString());
  }

  Future<GoogleUserDto> getMe() async {
    const storage = FlutterSecureStorage();

    var meFromStorage = await storage.read(key: 'me');

    if (meFromStorage != null) {
      return GoogleUserDto.fromJson(meFromStorage);
    }

    final email = await storage.read(key: 'email');

    if (email == "glemsomhet@gmail.com") {
      final GoogleUserDto googleUserDto = GoogleUserDto(
        id: const Uuid(),
        email: 'glemsomhet@gmail.com',
        phoneNumber: '5526279579',
        region: 'TR',
        type: 'Customer',
        termsAndServicesAccepted: false,
        verified: true,
        verificationCode: Random().nextInt(999999).toString(),
        createdAt: DateTime.now().add(const Duration(days:-6)),
        firstName: 'Büşra Melis',
        lastName: 'Gülbe',
        dateOfBirth: DateOnly.parse('09-09-2000'),
        googleId: ''
      );

      await storage.write(key: 'me', value: googleUserDto.toString());

      return googleUserDto;
    } else {
      throw Exception('Kullanıcı hsabı bulunamadı');
    }
  }

  void navigateToClientHomePage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => ClientHomePage()),
      (Route<dynamic> route) => false,
    );
  }

  Future<void> googleLogin(BuildContext context) async {
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

      final String email = googleAccount.email;

      const storage = FlutterSecureStorage();

      await storage.write(key: 'googleId', value: googleId);
      await storage.write(key: 'jwt', value: accessToken);
      await storage.write(key: 'email', value: email);
    } catch (error) {
      dialogAndExit(context, error.toString());
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
