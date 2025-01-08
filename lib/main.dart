import 'package:deneme/services/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:deneme/pages/client_home_page.dart';
import 'package:deneme/pages/client_register.dart';
import 'package:deneme/pages/coupon_page.dart';
import 'package:deneme/pages/event_page.dart';
import 'package:deneme/pages/home.dart';
import 'package:deneme/pages/user_account_page.dart';
import 'package:deneme/pages/splash_screen.dart';
import 'package:deneme/pages/search_page.dart';
import 'package:deneme/pages/wallet_page.dart';
import 'package:deneme/pages/comment_history_page.dart'; // SADECE BU IMPORT KALSIN
import 'package:deneme/pages/user_settings_page.dart';
import 'package:deneme/pages/recent_purchases_page.dart';
import 'package:deneme/pages/kvkk_page.dart';
import 'package:deneme/pages/feedback_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('tr_TR', null);
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/register': (context) => ClientRegisterPage(),
        '/client_home_page': (context) => ClientHomePage(),
        '/search_page': (context) => SearchPage(),
        '/wallet_page': (context) =>
            WalletPage(), // BURADA HATANIN KAYNAĞI OLABİLİR
        '/user_account_page': (context) => UserAccountPage(),
        '/coupon_page': (context) => CouponPage(),
        '/event_page': (context) => EventPage(),
        '/comment_history_page': (context) => CommentHistoryPage(),
        '/user_settings_page': (context) => UserSettingsPage(),
        '/recent_purchases_page': (context) => RecentPurchasesPage(),
        '/kvkk_page': (context) => KvkkPage(),
        '/feedback_page': (context) => FeedbackPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Etkinlikçe',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(),
    );
  }
}
