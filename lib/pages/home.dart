import 'package:deneme/services/customer_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:deneme/pages/client_home_page.dart';
import 'package:deneme/services/auth_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/services.dart'; // Uygulama kapatma için gerekli

class HomePage extends StatelessWidget {
  Future<void> googleLogin(BuildContext context) async {
    customer_service customerService = customer_service(context: context);

    await customerService.googleLogin();

    try {
      await customerService.getMe();

      customerService.navigateToClientHomePage();
    } catch (error) {
      print(error); // create'e ilerle
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
                    const Expanded(
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
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30)
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
