import 'package:deneme/components/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:deneme/Dtos/event_dto.dart';
import 'package:uuid/uuid.dart';

class RezervationsPage extends StatelessWidget {
  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE, d MMMM yyyy', 'tr_TR');
    return formatter.format(date);
  }

  void _showRatingDialog(BuildContext context, EventDto eventDto) {
    int selectedRating = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                'Etkinliği oyla.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(10, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRating = index + 1;
                      });
                    },
                    child: Icon(
                      Icons.star,
                      color: index < selectedRating
                          ? Color(0xFF20C6AE)
                          : Colors.transparent,
                      size: 24,
                    ),
                  );
                }),
              ),
              actions: [
                TextButton(
                  child: Text('İptal'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFFC62038),
                  ),
                ),
                TextButton(
                  child: Text('Tamam'),
                  onPressed: () {
                    // Burada rating'i backend'e göndermelisiniz.
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFF20C6AE),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<EventDto> sampleEvents = [
      EventDto(
        id: Uuid(),
        locationId: Uuid(),
        offerId: Uuid(),
        visualMediaIds: [],
        name: 'Event 1',
        description: 'This is a sample event.',
        amount: 100.0,
        currency: 'TRY',
        dateFrom: DateTime.now(),
        dateTo: DateTime.now().add(Duration(hours: 2)),
        createdAt: DateTime.now(),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Geçmiş Rezervasyonlarım',
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
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: sampleEvents.length,
        itemBuilder: (context, index) {
          final eventDto = sampleEvents[index];

          return GestureDetector(
            onTap: () => _showRatingDialog(context, eventDto),
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
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
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/images/event_placeholder.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  eventDto.name,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                _formatDate(eventDto.dateFrom),
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            eventDto.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Venue',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '${eventDto.amount.toStringAsFixed(0)} ${eventDto.currency}',
                                style: TextStyle(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
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
      bottomNavigationBar: CustomTabBar(),
    );
  }
}
