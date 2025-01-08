import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sayfa arka planı beyaz
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Ara" Başlığı
            Text(
              "Ara",
              style: TextStyle(
                color: Colors.red,
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.left,
            ),

            const SizedBox(height: 16),

            // Arama Çubuğu
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onChanged: (value) {
                        // Kullanıcı girdisi ile sıralama ve filtreleme işlemleri
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.black),
                    onPressed: () {
                      // Arama butonuna basıldığında sıralama ve filtreleme işlemleri
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Filtreleme Frame'i
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DropdownButton<String>(
                    value: null,
                    hint: Text("Filtrele"),
                    items: [
                      DropdownMenuItem(
                        value: "Canlı müzik",
                        child: Text("Canlı müzik"),
                      ),
                      DropdownMenuItem(
                        value: "Atölye",
                        child: Text("Atölye"),
                      ),
                      DropdownMenuItem(
                        value: "Alkollü",
                        child: Text("Alkollü"),
                      ),
                    ],
                    onChanged: (value) {
                      // Filtreleme işlemi
                    },
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8),
                  for (var label in [
                    "Müzik",
                    "Kahve",
                    "Yiyecek & İçecek",
                    "Sanat"
                  ])
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Butona tıklama ile filtreleme işlemi
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.grey[300], // Açık gri arka plan
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          label,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Sonuç ve Sıralama
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "10 sonuç", // Örnek olarak listelenen etkinlik sayısı 10
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                DropdownButton<String>(
                  value: null,
                  hint: Text("Önerilen"),
                  items: [
                    "Önerilen",
                    "En yeni",
                    "En uzak",
                    "En yakın",
                    "En ucuz",
                    "En pahalı",
                    "Değerlendirme sayısı",
                    "Yüksek puan",
                  ].map((option) {
                    return DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // Sıralama işlemi
                  },
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // İçerik Frame'i
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Örnek 10 içerik
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        // Görsel
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage('assets/event_coffee_day.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Bilgi
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "19 Nisan, Cumartesi · 20:00 - 22:00",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "Etkinlik Adı",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on, size: 12),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Coffee Lab",
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Kalp ve Yıldızlar
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.favorite_border, color: Colors.red),
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(5, (i) {
                                return Icon(
                                  i < 3 ? Icons.star : Icons.star_border,
                                  color: i < 3 ? Colors.yellow : Colors.grey,
                                  size: 12,
                                );
                              }),
                            ),
                          ],
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
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF20C6AE),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.search,
                    size: 24, color: Colors.white), // Görsel değişmedi
                onPressed: null, // Deaktif
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
      ),
    );
  }
}
