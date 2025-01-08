import 'package:flutter/material.dart';

class CouponPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header "Kupon"
            Text(
              "Kupon",
              style: TextStyle(
                color: Color(0xFFC62038),
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),

            // Search Bar
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
                        hintText: "Kupon arayın",
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Filter Options
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var label in [
                    "Satın alınan",
                    "Yaklaşan",
                    "Favorilerim",
                    "Takip edilen mekanlar",
                    "Sana özel",
                  ])
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: label == "Yaklaşan"
                              ? Colors.red
                              : Colors.grey[300],
                          foregroundColor:
                              label == "Yaklaşan" ? Colors.white : Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(label),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Results Count and Sorting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "4 sonuç", // Example count
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                DropdownButton<String>(
                  value: null,
                  hint: Text("Sırala (Önerilen)"),
                  items: [
                    "Tarih (en yeni)",
                    "Tarih (en eski)",
                    "Tarih (en yakın)",
                    "Tarih (en uzak)",
                    "Konum (en yakın)"
                  ].map((option) {
                    return DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Coupons List
            Expanded(
              child: ListView.builder(
                itemCount: 4, // Example count
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/event_page');
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          // Image
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage('assets/sample_image.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "12 Ocak, Pazar · 18:00 - 20:00",
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
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,
                                        size: 12, color: Colors.black),
                                    const SizedBox(width: 4),
                                    Text(
                                      "Mekan Adı",
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

                          // Time and Heart Icon
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Son 3 gün",
                                style: TextStyle(
                                  color: Color(0xFFC62038),
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Icon(Icons.favorite_border, color: Colors.grey),
                            ],
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
    );
  }
}
