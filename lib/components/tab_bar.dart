import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF20C6AE),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.search, size: 24, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/search_page');
              },
            ),
            IconButton(
              icon: Icon(Icons.wallet, size: 24, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/wallet_page');
              },
            ),
            GestureDetector(
              onTap: () {
                if (ModalRoute.of(context)?.settings.name !=
                    '/client_home_page') {
                  Navigator.pushNamed(context, '/client_home_page');
                }
              },
              child: Container(
                height: 40,
                width: 40,
                child: Image.asset(
                  'assets/logo_round.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.person, size: 24, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/user_account_page');
              },
            ),
            IconButton(
              icon: Icon(Icons.card_giftcard, size: 24, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/coupon_page');
              },
            ),
          ],
        ),
      ),
    );
  }
}
