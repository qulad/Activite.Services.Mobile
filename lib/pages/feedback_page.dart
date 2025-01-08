import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // url_launcher paketi eklendi
import '../components/tab_bar.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'bmg.gml@gmail.com',
      queryParameters: {
        'subject': _titleController.text,
        'body': _messageController.text,
      },
    );

    try {
      await launchUrl(emailUri);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('E-posta uygulaması açılamadı.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final lightGrey = Colors.grey[300]; // Açık gri renk tanımlandı

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0), // Sola boşluk eklendi
          child: Text(
            "Geri bildirimde bulun",
            style: TextStyle(
              fontFamily: 'Nunito Sans',
              fontWeight: FontWeight.w800, // ExtraBold
              fontSize: 20,
              color: Color(0xFFC62038),
            ),
          ),
        ),
        automaticallyImplyLeading: false, // Geri butonunu kaldırır
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Konu Başlığı Label
            SizedBox(
              height: screenHeight / 15,
              child: TextField(
                controller: _titleController,
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w300, // Light
                  fontSize: 14,
                  color: Colors.black, // Kullanıcı metin rengi siyah
                ),
                decoration: InputDecoration(
                  hintText: "Konu başlığı",
                  hintStyle: TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w300, // Light
                    fontSize: 14,
                    color: lightGrey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: lightGrey!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // odaklanınca kenarlık rengi
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: lightGrey),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Mesaj Kutusu
            SizedBox(
              height: screenHeight / 4.5,
              child: TextField(
                controller: _messageController,
                maxLines: null, // Metin kutusunun yüksekliğini otomatik ayarlar
                expands: true, // Metin kutusunun boş alanı doldurmasını sağlar
                textAlignVertical: TextAlignVertical.top,
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w300, // Light
                  fontSize: 14,
                  color: Colors.black, // Kullanıcı metin rengi siyah
                ),
                decoration: InputDecoration(
                  hintText: "Mesajınız...",
                  hintStyle: TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w300, // Light
                    fontSize: 14,
                    color: lightGrey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: lightGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // odaklanınca kenarlık rengi
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: lightGrey),
                  ),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),

            SizedBox(height: 16),

            // Gönder Butonu
            SizedBox(
              width:
                  double.infinity, // Butonun ekran genişliğini kaplaması için
              child: ElevatedButton(
                onPressed: _sendEmail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "GÖNDER",
                  style: TextStyle(
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w600, // SemiBold
                    fontSize: 10,
                    color: Colors.white,
                  ),
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
