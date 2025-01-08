import 'package:deneme/Dtos/google_user_dto.dart';
import 'package:deneme/services/customer_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ClientHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isWideScreen
                ? 1200
                : double.infinity, // Web için genişliği sınırla
          ),
          child: Column(
            children: [
              // "Öne Çıkanlar" Başlığı
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Öne Çıkanlar',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC62038),
                    ),
                  ),
                ),
              ),

              // Öne Çıkan Görseller Çerçevesi
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height / 8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: PageView.builder(
                  itemCount: 5, // Örnek veri
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height / 8),
                      child: Image.asset(
                        'assets/event_b_${index + 1}.png',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),

              // "Güncel Etkinlikler" Başlığı
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Güncel Etkinlikler',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC62038),
                    ),
                  ),
                ),
              ),

              // Güncel Etkinlikler Listesi
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // Örnek etkinlik sayısı
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Etkinlik Görseli
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/event_${index + 1}.png',
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          // Etkinlik Bilgileri
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '19 Nisan, Cumartesi · 20.00',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      color: Color(0xFF262627),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Etkinlik Başlığı',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter',
                                      color: Color(0xFF262627),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          size: 16, color: Color(0xFF262627)),
                                      SizedBox(width: 4),
                                      Text(
                                        'Mekan Adı',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          color: Color(0xFF262627),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Row(
                                        children: List.generate(
                                          5,
                                          (starIndex) => Icon(
                                            Icons.star,
                                            color: starIndex < 4
                                                ? Color(0xFFFDD836)
                                                : Colors.grey,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      // Fiyat bilgisi
                                      Text(
                                        '250 ₺',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Nunito Sans',
                                          color: Color(0xFF20C6AE),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Alt TabBar
      bottomNavigationBar: BottomAppBar(
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
              // Ortada logo
              GestureDetector(
                onTap: () {
                  // Eğer zaten aynı sayfadaysa, stabil kalmasını sağla
                  if (ModalRoute.of(context)?.settings.name !=
                      '/client_home_page') {
                    Navigator.pushNamed(context, '/client_home_page');
                  }
                },
                child: Container(
                  // logolarımızın boyutları
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
      ),
    );
  }
}
