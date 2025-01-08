import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:deneme/pages/client_home_page.dart';
import 'package:deneme/services/auth_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/services.dart';  // Uygulama kapatma için gerekli

class HomePage extends StatelessWidget {
  Future<void> googleLogin(BuildContext context) async {
    
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );

      final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();

      if (googleAccount == null) return;

      final GoogleSignInAuthentication googleAuth =
      await googleAccount.authentication;
      const String accessToken = googleAuth.accessToken!;

      const String googleId = googleAccount.id!;

      final storage = FlutterSecureStorage();

      await storage.write(key: 'googleId', value: googleId);
      await storage.write(key: 'jwt', value: accessToken);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClientHomePage()),
      );
    } catch (error) {
      print(error);

      // Hata durumunda popup göster
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Bir Hata Oluştu"),
            content: Text("Hata: ${error.toString()}"), // Hata mesajını göster
            actions: <Widget>[
              TextButton(
                child: Text("Tamam"),
                onPressed: () {
                  Navigator.of(context).pop(); // Popup'ı kapat
                  Future.delayed(Duration(milliseconds: 300), () {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
        height: MediaQuery.of(context).size.height / 6,
    child: Image.asset('assets/logo.png'),
    ),
    SizedBox(height: 50),
    Container(
    width: 245,
    height: 56,
    child: ElevatedButton(
    onPressed: () => googleLogin(context),
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    elevation: 2,
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Image.asset(
    'assets/google_logo.png',
    height: 24,
    ),
    ),
    Expanded(
    child: Text(
    'Google ile Giriş Yap',
    style: TextStyle(color: Colors.black, fontSize: 16),
    textAlign: TextAlign.center,
    ),
    ),
    ],
    ),
    ),
    ),  
    SizedBox(height: 20),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Align(
    alignment: Alignment.center,
    child: RichText(
    text: TextSpan(
    text: 'Hesabın yok mu? ',
    style: TextStyle(color: Colors.black, fontSize: 14),
    children: [
    TextSpan(
    text: 'Üye ol',
    style: TextStyle(
    color: Color(0xFFD18788),
    fontSize: 14,
    fontWeight: FontWeight.bold,
    ),
    recognizer: TapGestureRecognizer()
    ..onTap = () {
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(
    builder: (context) => ClientHomePage(),
    ));
    },
    ),
    ],
    ),
    ),
    ),
    ),
    SizedBox(height: 20),

