import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Input formatters için eklendi

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Removed the AppBar

      body: Container(
        color: Colors.white, // Set background to white
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Cüzdan',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 16),

            // Mevcut bakiye text (aligned to the right)
            Text(
              'Mevcut bakiye',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color(0xFF747688),
              ),
            ),
            SizedBox(height: 16),

            // Balance label without shadow
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              width: MediaQuery.of(context).size.width / 3, // 1/3 width
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE4DFDF)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0',
                    style: TextStyle(
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: Color(0xFF20C6AE),
                    ),
                  ),
                  Text(
                    '₺',
                    style: TextStyle(
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF20C6AE),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Divider line
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
            SizedBox(height: 16), // Adjusted space

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // User input label with radius and shadow
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        'Cüzdana ne kadar para aktarmak istediğinizi giriniz.',
                        style: TextStyle(
                          fontFamily: 'Nunito Sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color(0xFF747688),
                        ),
                      ),
                      SizedBox(height: 16), // Added Space
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE4DFDF)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            // User input for amount
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'minimum 100',
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Color(0xFF20C6AE),
                                ),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '₺',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color(0xFF20C6AE),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])),

                // ÖDE button to the right of the balance transfer label
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      // Payment logic goes here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5EDA00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 32), // Wider button
                    ),
                    child: Text(
                      'ÖDE',
                      style: TextStyle(
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 16),

            // Divider line
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
            SizedBox(height: 16),

            // Geçmiş harcamalar title
            Text(
              'Geçmiş harcamalar',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color(0xFF747688),
              ),
            ),
            SizedBox(height: 16),

            // Transactions list frame with example data
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Example count, replace with actual data
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.2), // Extended shadow
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Transaction Date
                        Text(
                          '25 Nisan, Çarşamba · 13:41',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),

                        // Amount Paid with thicker font style
                        Text(
                          '100 ₺',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),

                        // Location and Event info with outlined location icon
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                size: 16, color: Colors.black),
                            SizedBox(width: 8),
                            Text(
                              'Gözaltı Pub · Suçluların Partisi',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color: Colors.black,
                              ),
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
              // Ortada Logo
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
                  Navigator.pushNamed(context, '/wallet_page');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
