import 'package:deneme/components/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:deneme/Dtos/event_dto.dart';
import 'package:uuid/uuid.dart';
import 'package:deneme/models/event.dart';

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

  final _formKey = GlobalKey<FormState>();

  final List<Event> pastEvents = [
    Event(
        miniPicture: 'assets/past_event_1.png',
        pictures: [
          'assets/past_event1_1.png',
          'assets/past_event1_2.png',
          'assets/past_event1_3.png'
        ],
        title: 'Past Event 1',
        description: 'Past Event 1 description',
        location: 'Past Event 1 location',
        date: DateTime.now(),
        price: 100.0),
    Event(
        miniPicture: 'assets/past_event_2.png',
        pictures: [
          'assets/past_event2_1.png',
          'assets/past_event2_2.png',
          'assets/past_event2_3.png'
        ],
        title: 'Past Event 2',
        description: 'Past Event 2 description',
        location: 'Past Event 2 location',
        date: DateTime.now(),
        price: 200.0),
    Event(
        miniPicture: 'assets/past_event_3.png',
        pictures: [
          'assets/past_event3_1.png',
          'assets/past_event3_2.png',
          'assets/past_event3_3.png'
        ],
        title: 'Past Event 3',
        description: 'Past Event 3 description',
        location: 'Past Event 3 location',
        date: DateTime.now(),
        price: 300.0),
  ];

  // final random = Random();
  // shuffledEvents = List.from(events).shuffle(random);
  final List<Event> events = [
    Event(
        miniPicture: 'assets/event_1.png',
        pictures: [
          'assets/event1_1.png',
          'assets/event1_2.png',
          'assets/event1_3.png'
        ],
        title: 'Geç Yılbaşı Partisi',
        description: '',
        location: '',
        date: DateTime.now(),
        price: 100.0),
    Event(
        miniPicture: 'assets/event_2.png',
        pictures: [
          'assets/event2_1.png',
          'assets/event2_2.png',
          'assets/event2_3.png'
        ],
        title: 'Etkinlik 2',
        description: 'Etkinlik 2 açıklaması',
        location: 'Etkinlik 2 yeri',
        date: DateTime.now(),
        price: 200.0),
    Event(
        miniPicture: 'assets/event_3.png',
        pictures: [
          'assets/event3_1.png',
          'assets/event3_2.png',
          'assets/event3_3.png'
        ],
        title: 'Etkinlik 3',
        description: 'Etkinlik 3 açıklaması',
        location: 'Etkinlik 3 yeri',
        date: DateTime.now(),
        price: 300.0),
    Event(
        miniPicture: 'assets/event_4.png',
        pictures: [
          'assets/event4_1.png',
          'assets/event4_2.png',
          'assets/event4_3.png'
        ],
        title: 'Etkinlik 4',
        description: 'Etkinlik 4 açıklaması',
        location: 'Etkinlik 4 yeri',
        date: DateTime.now(),
        price: 400.0),
    Event(
        miniPicture: 'assets/event_5.png',
        pictures: [
          'assets/event5_1.png',
          'assets/event5_2.png',
          'assets/event5_3.png'
        ],
        title: 'Etkinlik 5',
        description: 'Etkinlik 5 açıklaması',
        location: 'Etkinlik 5 yeri',
        date: DateTime.now(),
        price: 500.0),
    Event(
        miniPicture: 'assets/event_6.png',
        pictures: [
          'assets/event6_1.png',
          'assets/event6_2.png',
          'assets/event6_3.png'
        ],
        title: 'Etkinlik 6',
        description: 'Etkinlik 6 açıklaması',
        location: 'Etkinlik 6 yeri',
        date: DateTime.now(),
        price: 600.0),
    Event(
        miniPicture: 'assets/event_7.png',
        pictures: [
          'assets/event7_1.png',
          'assets/event7_2.png',
          'assets/event7_3.png'
        ],
        title: 'Etkinlik 7',
        description: 'Etkinlik 7 açıklaması',
        location: 'Etkinlik 7 yeri',
        date: DateTime.now(),
        price: 700.0),
    Event(
        miniPicture: 'assets/event_8.png',
        pictures: [
          'assets/event8_1.png',
          'assets/event8_2.png',
          'assets/event8_3.png'
        ],
        title: 'Etkinlik 8',
        description: 'Etkinlik 8 açıklaması',
        location: 'Etkinlik 8 yeri',
        date: DateTime.now(),
        price: 800.0),
    Event(
        miniPicture: 'assets/event_9.png',
        pictures: [
          'assets/event9_1.png',
          'assets/event9_2.png',
          'assets/event9_3.png'
        ],
        title: 'Etkinlik 9',
        description: 'Etkinlik 9 açıklaması',
        location: 'Etkinlik 9 yeri',
        date: DateTime.now(),
        price: 900.0),
    Event(
        miniPicture: 'assets/event_10.png',
        pictures: [
          'assets/event10_1.png',
          'assets/event10_2.png',
          'assets/event10_3.png'
        ],
        title: 'Etkinlik 10',
        description: 'Etkinlik 10 açıklaması',
        location: 'Etkinlik 10 yeri',
        date: DateTime.now(),
        price: 1000.0),
    Event(
        miniPicture: 'assets/event_11.png',
        pictures: [
          'assets/event11_1.png',
          'assets/event11_2.png',
          'assets/event11_3.png'
        ],
        title: 'Etkinlik 11',
        description: 'Etkinlik 11 açıklaması',
        location: 'Etkinlik 11 yeri',
        date: DateTime.now(),
        price: 1100.0),
    Event(
        miniPicture: 'assets/event_12.png',
        pictures: [
          'assets/event12_1.png',
          'assets/event12_2.png',
          'assets/event12_3.png'
        ],
        title: 'Etkinlik 12',
        description: 'Etkinlik 12 açıklaması',
        location: 'Etkinlik 12 yeri',
        date: DateTime.now(),
        price: 1200.0),
    Event(
        miniPicture: 'assets/event_13.png',
        pictures: [
          'assets/event13_1.png',
          'assets/event13_2.png',
          'assets/event13_3.png'
        ],
        title: 'Etkinlik 13',
        description: 'Etkinlik 13 açıklaması',
        location: 'Etkinlik 13 yeri',
        date: DateTime.now(),
        price: 1300.0),
    Event(
        miniPicture: 'assets/event_14.png',
        pictures: [
          'assets/event14_1.png',
          'assets/event14_2.png',
          'assets/event14_3.png'
        ],
        title: 'Etkinlik 14',
        description: 'Etkinlik 14 açıklaması',
        location: 'Etkinlik 14 yeri',
        date: DateTime.now(),
        price: 1400.0),
    Event(
        miniPicture: 'assets/event_15.png',
        pictures: [
          'assets/event15_1.png',
          'assets/event15_2.png',
          'assets/event15_3.png'
        ],
        title: 'Etkinlik 15',
        description: 'Etkinlik 15 açıklaması',
        location: 'Etkinlik 15 yeri',
        date: DateTime.now(),
        price: 1500.0),
    Event(
        miniPicture: 'assets/event_16.png',
        pictures: [
          'assets/event16_1.png',
          'assets/event16_2.png',
          'assets/event16_3.png'
        ],
        title: 'Etkinlik 16',
        description: 'Etkinlik 16 açıklaması',
        location: 'Etkinlik 16 yeri',
        date: DateTime.now(),
        price: 1600.0),
    Event(
        miniPicture: 'assets/event_17.png',
        pictures: [
          'assets/event17_1.png',
          'assets/event17_2.png',
          'assets/event17_3.png'
        ],
        title: 'Etkinlik 17',
        description: 'Etkinlik 17 açıklaması',
        location: 'Etkinlik 17 yeri',
        date: DateTime.now(),
        price: 1700.0),
    Event(
        miniPicture: 'assets/event_18.png',
        pictures: [
          'assets/event18_1.png',
          'assets/event18_2.png',
          'assets/event18_3.png'
        ],
        title: 'Etkinlik 18',
        description: 'Etkinlik 18 açıklaması',
        location: 'Etkinlik 18 yeri',
        date: DateTime.now(),
        price: 1800.0),
    Event(
        miniPicture: 'assets/event_19.png',
        pictures: [
          'assets/event19_1.png',
          'assets/event19_2.png',
          'assets/event19_3.png'
        ],
        title: 'Etkinlik 19',
        description: 'Etkinlik 19 açıklaması',
        location: 'Etkinlik 19 yeri',
        date: DateTime.now(),
        price: 1900.0),
    Event(
        miniPicture: 'assets/event_20.png',
        pictures: [
          'assets/event20_1.png',
          'assets/event20_2.png',
          'assets/event20_3.png'
        ],
        title: 'Etkinlik 20',
        description: 'Etkinlik 20 açıklaması',
        location: 'Etkinlik 20 yeri',
        date: DateTime.now(),
        price: 2000.0),
  ];

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
