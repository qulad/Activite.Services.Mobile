import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:deneme/google_sign_in.dart';
import 'package:deneme/services/google_register.dart';

class ClientRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Yarim logo
            Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(height: 50),

            // Google ile Üye Ol butonu
            Container(
              width: 245,
              height: 56,
              child: ElevatedButton(
                onPressed: () async {
                  bool isRegistered =
                      await googleRegister(context); // Kayıt başlatılıyor
                  if (isRegistered) {
                    // Kayıt başarılıysa home.dart sayfasına yönlendir
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
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
                        'Google ile Üye Ol',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Apple ile Üye Ol butonu (şimdilik işlevsiz)
            Container(
              width: 245,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Şimdilik işlevsiz
                },
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
                        'assets/apple_logo.png',
                        height: 24,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Apple ile Üye Ol',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Zaten hesabın var mı? metni ve Giriş Yap linki
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Zaten hesabın var mı? ',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      TextSpan(
                        text: 'Giriş Yap',
                        style: TextStyle(
                          color: Color(0xFFD18788),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Giriş Yap'a tıklanınca home.dart'a yönlendir
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
