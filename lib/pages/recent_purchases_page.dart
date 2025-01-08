import 'package:flutter/material.dart';
import '../components/tab_bar.dart';

class RecentPurchasesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Geçmiş Harcamalarım Sayfası',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: CustomTabBar(),
    );
  }
}
