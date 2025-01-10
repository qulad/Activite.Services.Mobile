import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:deneme/components/tab_bar.dart';
import 'package:intl/intl.dart';
import 'package:deneme/models/event.dart';

class ClientHomePage extends StatelessWidget {
  Future<Map<String, dynamic>?> fetchDataWithToken(String token) async {
    final Uri url = Uri.parse('app.activite.tech/users/me');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }

  Future<(String?, String?)> readDataAndCheckNull() async {
    final storage = FlutterSecureStorage();
    String? googleId = await storage.read(key: 'googleId');
    String? jwt = await storage.read(key: 'jwt');
    return (jwt, googleId);
  }

  Future<void> clearAllData() async {
    final storage = FlutterSecureStorage();
    await storage.deleteAll();
    print('Tüm veriler silindi.');
  }

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('d MMMM, EEEE · HH:mm', 'tr_TR');
    return formatter.format(date);
  }

  final List<Event> events = [
    Event(
        miniPicture: 'assets/event_1.png',
        pictures: [
          'assets/event_1_1.png',
          'assets/event_1_2.png',
          'assets/event_1_3.png'
        ],
        title: 'Geç Yılbaşı Partisi',
        description: '',
        location: '',
        date: DateTime.now(),
        price: 100.0),
    Event(
        miniPicture: 'assets/event_2.png',
        pictures: [
          'assets/event_2_1.png',
          'assets/event_2_2.png',
          'assets/event_2_3.png'
        ],
        title: 'Etkinlik 2',
        description: 'Etkinlik 2 açıklaması',
        location: 'Etkinlik 2 yeri',
        date: DateTime.now(),
        price: 200.0),
    Event(
        miniPicture: 'assets/event_3.png',
        pictures: [
          'assets/event_3_1.png',
          'assets/event_3_2.png',
          'assets/event_3_3.png'
        ],
        title: 'Etkinlik 3',
        description: 'Etkinlik 3 açıklaması',
        location: 'Etkinlik 3 yeri',
        date: DateTime.now(),
        price: 300.0),
    Event(
        miniPicture: 'assets/event_4.png',
        pictures: [
          'assets/event_4_1.png',
          'assets/event_4_2.png',
          'assets/event_4_3.png'
        ],
        title: 'Etkinlik 4',
        description: 'Etkinlik 4 açıklaması',
        location: 'Etkinlik 4 yeri',
        date: DateTime.now(),
        price: 400.0),
    Event(
        miniPicture: 'assets/event_5.png',
        pictures: [
          'assets/event_5_1.png',
          'assets/event_5_2.png',
          'assets/event_5_3.png'
        ],
        title: 'Etkinlik 5',
        description: 'Etkinlik 5 açıklaması',
        location: 'Etkinlik 5 yeri',
        date: DateTime.now(),
        price: 500.0),
    Event(
        miniPicture: 'assets/event_6.png',
        pictures: [
          'assets/event_6_1.png',
          'assets/event_6_2.png',
          'assets/event_6_3.png'
        ],
        title: 'Etkinlik 6',
        description: 'Etkinlik 6 açıklaması',
        location: 'Etkinlik 6 yeri',
        date: DateTime.now(),
        price: 600.0),
    Event(
        miniPicture: 'assets/event_7.png',
        pictures: [
          'assets/event_7_1.png',
          'assets/event_7_2.png',
          'assets/event_7_3.png'
        ],
        title: 'Etkinlik 7',
        description: 'Etkinlik 7 açıklaması',
        location: 'Etkinlik 7 yeri',
        date: DateTime.now(),
        price: 700.0),
    Event(
        miniPicture: 'assets/event_8.png',
        pictures: [
          'assets/event_8_1.png',
          'assets/event_8_2.png',
          'assets/event_8_3.png'
        ],
        title: 'Etkinlik 8',
        description: 'Etkinlik 8 açıklaması',
        location: 'Etkinlik 8 yeri',
        date: DateTime.now(),
        price: 800.0),
    Event(
        miniPicture: 'assets/event_9.png',
        pictures: [
          'assets/event_9_1.png',
          'assets/event_9_2.png',
          'assets/event_9_3.png'
        ],
        title: 'Etkinlik 9',
        description: 'Etkinlik 9 açıklaması',
        location: 'Etkinlik 9 yeri',
        date: DateTime.now(),
        price: 900.0),
    Event(
        miniPicture: 'assets/event_10.png',
        pictures: [
          'assets/event_10_1.png',
          'assets/event_10_2.png',
          'assets/event_10_3.png'
        ],
        title: 'Etkinlik 10',
        description: 'Etkinlik 10 açıklaması',
        location: 'Etkinlik 10 yeri',
        date: DateTime.now(),
        price: 1000.0),
    Event(
        miniPicture: 'assets/event_11.png',
        pictures: [
          'assets/event_11_1.png',
          'assets/event_11_2.png',
          'assets/event_11_3.png'
        ],
        title: 'Etkinlik 11',
        description: 'Etkinlik 11 açıklaması',
        location: 'Etkinlik 11 yeri',
        date: DateTime.now(),
        price: 1100.0),
    Event(
        miniPicture: 'assets/event_12.png',
        pictures: [
          'assets/event_12_1.png',
          'assets/event_12_2.png',
          'assets/event_12_3.png'
        ],
        title: 'Etkinlik 12',
        description: 'Etkinlik 12 açıklaması',
        location: 'Etkinlik 12 yeri',
        date: DateTime.now(),
        price: 1200.0),
    Event(
        miniPicture: 'assets/event_13.png',
        pictures: [
          'assets/event_13_1.png',
          'assets/event_13_2.png',
          'assets/event_13_3.png'
        ],
        title: 'Etkinlik 13',
        description: 'Etkinlik 13 açıklaması',
        location: 'Etkinlik 13 yeri',
        date: DateTime.now(),
        price: 1300.0),
    Event(
        miniPicture: 'assets/event_14.png',
        pictures: [
          'assets/event_14_1.png',
          'assets/event_14_2.png',
          'assets/event_14_3.png'
        ],
        title: 'Etkinlik 14',
        description: 'Etkinlik 14 açıklaması',
        location: 'Etkinlik 14 yeri',
        date: DateTime.now(),
        price: 1400.0),
    Event(
        miniPicture: 'assets/event_15.png',
        pictures: [
          'assets/event_15_1.png',
          'assets/event_15_2.png',
          'assets/event_15_3.png'
        ],
        title: 'Etkinlik 15',
        description: 'Etkinlik 15 açıklaması',
        location: 'Etkinlik 15 yeri',
        date: DateTime.now(),
        price: 1500.0),
    Event(
        miniPicture: 'assets/event_16.png',
        pictures: [
          'assets/event_16_1.png',
          'assets/event_16_2.png',
          'assets/event_16_3.png'
        ],
        title: 'Etkinlik 16',
        description: 'Etkinlik 16 açıklaması',
        location: 'Etkinlik 16 yeri',
        date: DateTime.now(),
        price: 1600.0),
    Event(
        miniPicture: 'assets/event_17.png',
        pictures: [
          'assets/event_17_1.png',
          'assets/event_17_2.png',
          'assets/event_17_3.png'
        ],
        title: 'Etkinlik 17',
        description: 'Etkinlik 17 açıklaması',
        location: 'Etkinlik 17 yeri',
        date: DateTime.now(),
        price: 1700.0),
    Event(
        miniPicture: 'assets/event_18.png',
        pictures: [
          'assets/event_18_1.png',
          'assets/event_18_2.png',
          'assets/event_18_3.png'
        ],
        title: 'Etkinlik 18',
        description: 'Etkinlik 18 açıklaması',
        location: 'Etkinlik 18 yeri',
        date: DateTime.now(),
        price: 1800.0),
    Event(
        miniPicture: 'assets/event_19.png',
        pictures: [
          'assets/event_19_1.png',
          'assets/event_19_2.png',
          'assets/event_19_3.png'
        ],
        title: 'Etkinlik 19',
        description: 'Etkinlik 19 açıklaması',
        location: 'Etkinlik 19 yeri',
        date: DateTime.now(),
        price: 1900.0),
    Event(
        miniPicture: 'assets/event_20.png',
        pictures: [
          'assets/event_20_1.png',
          'assets/event_20_2.png',
          'assets/event_20_3.png'
        ],
        title: 'Etkinlik 20',
        description: 'Etkinlik 20 açıklaması',
        location: 'Etkinlik 20 yeri',
        date: DateTime.now(),
        price: 2000.0),
  ];

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Güncel Etkinlikler',
          style: TextStyle(
            color: Color(0xFFC62038),
            fontSize: 20,
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isWideScreen ? 1200 : double.infinity,
          ),
          child: Column(
            children: [
              // Arama Çubuğu
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Aramak istediğiniz içeriği yazınız",
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search, color: Colors.black),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),

              // Etkinlikler Listesi
              Expanded(
                child: ListView.builder(
                  itemCount: events.length + 1,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Öne Çıkanlar',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF20C6AE),
                          ),
                        ),
                      );
                    }

                    final eventIndex = index - 1;
                    final event = events[eventIndex];
                    final isPromoted = eventIndex < 5;

                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/event_page',
                            arguments: event);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          gradient: isPromoted
                              ? LinearGradient(
                                  colors: [
                                    Color(0xFF20C6AE),
                                    Colors.white,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                )
                              : null,
                          color: isPromoted ? null : Colors.white,
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  event.miniPicture,
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _formatDate(event.date),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        color: Color(0xFF262627),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      event.title,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Inter',
                                        color: Color(0xFF262627),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      event.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
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
                                          event.location,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Inter',
                                            color: Color(0xFF262627),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '${event.price.toStringAsFixed(0)} ₺',
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
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomTabBar(),
    );
  }
}
