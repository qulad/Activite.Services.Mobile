import 'package:flutter/material.dart';
import '../components/tab_bar.dart';

class UserAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/comment_history_page');
              },
              child: Text(
                'Yorumlarım',
                style: TextStyle(
                  color: Color(0xFFC62038),
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/user_settings_page');
              },
              child: Text(
                'Hesap ayarları',
                style: TextStyle(
                  color: Color(0xFFC62038),
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/recent_purchases_page');
              },
              child: Text(
                'Geçmiş harcamalarım',
                style: TextStyle(
                  color: Color(0xFFC62038),
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/kvkk_page');
              },
              child: Text(
                'KVKK',
                style: TextStyle(
                  color: Color(0xFFC62038),
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/feedback_page');
              },
              child: Text(
                'Geri bildirimde bulun',
                style: TextStyle(
                  color: Color(0xFFC62038),
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomTabBar(),
    );
  }
}
