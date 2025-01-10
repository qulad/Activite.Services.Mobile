import 'package:flutter/material.dart';
import 'package:deneme/models/event.dart';
import '../components/tab_bar.dart';
import 'package:deneme/services/customer_service.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  int _currentImageIndex = 0;

  void _showReservationConfirmation(BuildContext context, String eventTitle) {
    CustomerService customerService = new CustomerService();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "'${eventTitle}' için rezervasyonunuz yapıldı.",
            style: TextStyle(
              fontFamily: 'Nunito Sans',
              fontSize: 16,
            ),
          ),
          actions: [
            Expanded(
              child: TextButton(
                child: Text('Tamam'),
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  customerService.navigateToClientHomePage(context);
                },
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Event event = ModalRoute.of(context)!.settings.arguments as Event;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFFC62038)), // Geri tuşu rengi
        title: Text(
          'Etkinlik Detayı',
          style: TextStyle(
            color: Color(0xFFC62038), // Başlık metninin rengi
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0, // AppBar'ın alt çizgisi kaldırıldı
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Slider section remains the same
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: event.pictures.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      event.pictures[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      event.pictures.length,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentImageIndex == index
                              ? Color(0xFFFFFFFF)
                              : Color(0xFFFFFFFF).withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            // Expanded kullanarak geri kalan alanı dolduruyoruz
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            event.title,
                            style: TextStyle(
                              color: Color(0xFFC62038),
                              fontSize: 24,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          _formatDate(event.date),
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      event.description,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Text(
                          '${event.price.toStringAsFixed(0)} ₺',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF20C6AE),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // New Reservation Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () =>
                            _showReservationConfirmation(context, event.title),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5EDA00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.bottomRight,
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                        ),
                        child: Text(
                          'REZERVE ET*',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 12,
                            fontFamily: 'Nunito Sans',
                            fontWeight: FontWeight.w900, // Black weight
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Reservation Note
                    Text(
                      '* Rezervasyon ödemeleri etkinlik alanında kapıda ödeme olarak alınacaktır.',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomTabBar(),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
