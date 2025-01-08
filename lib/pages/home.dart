import 'package:deneme/pages/client_register.dart';
import 'package:deneme/services/customer_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> googleLogin(BuildContext context) async {
    CustomerService customerService = CustomerService(context: context);

    await customerService.googleLogin();

    try {
      await customerService.getMe();

      customerService.navigateToClientHomePage();
    } catch (error) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClientRegisterPage()),
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
            const Padding(padding: EdgeInsets.symmetric(horizontal: 30)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
