import 'package:deneme/services/customer_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ClientRegisterPage extends StatefulWidget {
  @override
  _ClientRegisterPageState createState() => _ClientRegisterPageState();
}

class Event {
  final String miniPicture;
  final List<String> pictures;
  final String title;
  final String description;
  final String location;
  final DateTime date;
  final double price;

  Event({
    required this.miniPicture,
    required this.pictures,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
    required this.price
  });
}

class _ClientRegisterPageState extends State<ClientRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final List<Event> pastEvents = [
    Event(
      miniPicture: 'assets/past_event1.jpg',
      pictures: ['assets/past_event1_1.jpg', 'assets/past_event1_2.jpg', 'assets/past_event1_3.jpg'],
      title: 'Past Event 1',
      description: 'Past Event 1 description',
      location: 'Past Event 1 location',
      date: DateTime.now(),
      price: 100.0
    ),
    Event(
      miniPicture: 'assets/past_event2.jpg',
      pictures: ['assets/past_event2_1.jpg', 'assets/past_event2_2.jpg', 'assets/past_event2_3.jpg'],
      title: 'Past Event 2',
      description: 'Past Event 2 description',
      location: 'Past Event 2 location',
      date: DateTime.now(),
      price: 200.0
    ),
    Event(
      miniPicture: 'assets/past_event3.jpg',
      pictures: ['assets/past_event3_1.jpg', 'assets/past_event3_2.jpg', 'assets/past_event3_3.jpg'],
      title: 'Past Event 3',
      description: 'Past Event 3 description',
      location: 'Past Event 3 location',
      date: DateTime.now(),
      price: 300.0
    ),
  ];

  // final random = Random();
  // shuffledEvents = List.from(events).shuffle(random);
  final List<Event> events = [
    Event(
      miniPicture: 'assets/event1.jpg',
      pictures: ['assets/event1_1.jpg', 'assets/event1_2.jpg', 'assets/event1_3.jpg'],
      title: 'Geç Yılbaşı Partisi',
      description: '',
      location: '',
      date: DateTime.now(),
      price: 100.0
    ),
    Event(
      miniPicture: 'assets/event2.jpg',
      pictures: ['assets/event2_1.jpg', 'assets/event2_2.jpg', 'assets/event2_3.jpg'],
      title: 'Etkinlik 2',
      description: 'Etkinlik 2 açıklaması',
      location: 'Etkinlik 2 yeri',
      date: DateTime.now(),
      price: 200.0
    ),
    Event(
      miniPicture: 'assets/event3.jpg',
      pictures: ['assets/event3_1.jpg', 'assets/event3_2.jpg', 'assets/event3_3.jpg'],
      title: 'Etkinlik 3',
      description: 'Etkinlik 3 açıklaması',
      location: 'Etkinlik 3 yeri',
      date: DateTime.now(),
      price: 300.0
    ),
    Event(
      miniPicture: 'assets/event4.jpg',
      pictures: ['assets/event4_1.jpg', 'assets/event4_2.jpg', 'assets/event4_3.jpg'],
      title: 'Etkinlik 4',
      description: 'Etkinlik 4 açıklaması',
      location: 'Etkinlik 4 yeri',
      date: DateTime.now(),
      price: 400.0
      ),
    Event(
      miniPicture: 'assets/event5.jpg',
      pictures: ['assets/event5_1.jpg', 'assets/event5_2.jpg', 'assets/event5_3.jpg'],
      title: 'Etkinlik 5',
      description: 'Etkinlik 5 açıklaması',
      location: 'Etkinlik 5 yeri',
      date: DateTime.now(),
      price: 500.0
    ),
    Event(
      miniPicture: 'assets/event6.jpg',
      pictures: ['assets/event6_1.jpg', 'assets/event6_2.jpg', 'assets/event6_3.jpg'],
      title: 'Etkinlik 6',
      description: 'Etkinlik 6 açıklaması',
      location: 'Etkinlik 6 yeri',
      date: DateTime.now(),
      price: 600.0
    ),
    Event(
      miniPicture: 'assets/event7.jpg',
      pictures: ['assets/event7_1.jpg', 'assets/event7_2.jpg', 'assets/event7_3.jpg'],
      title: 'Etkinlik 7',
      description: 'Etkinlik 7 açıklaması',
      location: 'Etkinlik 7 yeri',
      date: DateTime.now(),
      price: 700.0
    ),
    Event(
      miniPicture: 'assets/event8.jpg',
      pictures: ['assets/event8_1.jpg', 'assets/event8_2.jpg', 'assets/event8_3.jpg'],
      title: 'Etkinlik 8',
      description: 'Etkinlik 8 açıklaması',
      location: 'Etkinlik 8 yeri',
      date: DateTime.now(),
      price: 800.0
    ),
    Event(
      miniPicture: 'assets/event9.jpg',
      pictures: ['assets/event9_1.jpg', 'assets/event9_2.jpg', 'assets/event9_3.jpg'],
      title: 'Etkinlik 9',
      description: 'Etkinlik 9 açıklaması',
      location: 'Etkinlik 9 yeri',
      date: DateTime.now(),
      price: 900.0
    ),
    Event(
      miniPicture: 'assets/event10.jpg',
      pictures: ['assets/event10_1.jpg', 'assets/event10_2.jpg', 'assets/event10_3.jpg'],
      title: 'Etkinlik 10',
      description: 'Etkinlik 10 açıklaması',
      location: 'Etkinlik 10 yeri',
      date: DateTime.now(),
      price: 1000.0
    ),
    Event(
      miniPicture: 'assets/event11.jpg',
      pictures: ['assets/event11_1.jpg', 'assets/event11_2.jpg', 'assets/event11_3.jpg'],
      title: 'Etkinlik 11',
      description: 'Etkinlik 11 açıklaması',
      location: 'Etkinlik 11 yeri',
      date: DateTime.now(),
      price: 1100.0
    ),
    Event(
      miniPicture: 'assets/event12.jpg',
      pictures: ['assets/event12_1.jpg', 'assets/event12_2.jpg', 'assets/event12_3.jpg'],
      title: 'Etkinlik 12',
      description: 'Etkinlik 12 açıklaması',
      location: 'Etkinlik 12 yeri',
      date: DateTime.now(),
      price: 1200.0
    ),
    Event(
      miniPicture: 'assets/event13.jpg',
      pictures: ['assets/event13_1.jpg', 'assets/event13_2.jpg', 'assets/event13_3.jpg'],
      title: 'Etkinlik 13',
      description: 'Etkinlik 13 açıklaması',
      location: 'Etkinlik 13 yeri',
      date: DateTime.now(),
      price: 1300.0
    ),
    Event(
      miniPicture: 'assets/event14.jpg',
      pictures: ['assets/event14_1.jpg', 'assets/event14_2.jpg', 'assets/event14_3.jpg'],
      title: 'Etkinlik 14',
      description: 'Etkinlik 14 açıklaması',
      location: 'Etkinlik 14 yeri',
      date: DateTime.now(),
      price: 1400.0
    ),
    Event(
      miniPicture: 'assets/event15.jpg',
      pictures: ['assets/event15_1.jpg', 'assets/event15_2.jpg', 'assets/event15_3.jpg'],
      title: 'Etkinlik 15',
      description: 'Etkinlik 15 açıklaması',
      location: 'Etkinlik 15 yeri',
      date: DateTime.now(),
      price: 1500.0
    ),
    Event(
      miniPicture: 'assets/event16.jpg',
      pictures: ['assets/event16_1.jpg', 'assets/event16_2.jpg', 'assets/event16_3.jpg'],
      title: 'Etkinlik 16',
      description: 'Etkinlik 16 açıklaması',
      location: 'Etkinlik 16 yeri',
      date: DateTime.now(),
      price: 1600.0
    ),
    Event(
      miniPicture: 'assets/event17.jpg',
      pictures: ['assets/event17_1.jpg', 'assets/event17_2.jpg', 'assets/event17_3.jpg'],
      title: 'Etkinlik 17',
      description: 'Etkinlik 17 açıklaması',
      location: 'Etkinlik 17 yeri',
      date: DateTime.now(),
      price: 1700.0
    ),
    Event(
      miniPicture: 'assets/event18.jpg',
      pictures: ['assets/event18_1.jpg', 'assets/event18_2.jpg', 'assets/event18_3.jpg'],
      title: 'Etkinlik 18',
      description: 'Etkinlik 18 açıklaması',
      location: 'Etkinlik 18 yeri',
      date: DateTime.now(),
      price: 1800.0
    ),
    Event(
      miniPicture: 'assets/event19.jpg',
      pictures: ['assets/event19_1.jpg', 'assets/event19_2.jpg', 'assets/event19_3.jpg'],
      title: 'Etkinlik 19',
      description: 'Etkinlik 19 açıklaması',
      location: 'Etkinlik 19 yeri',
      date: DateTime.now(),
      price: 1900.0
    ),
    Event(
      miniPicture: 'assets/event20.jpg',
      pictures: ['assets/event20_1.jpg', 'assets/event20_2.jpg', 'assets/event20_3.jpg'],
      title: 'Etkinlik 20',
      description: 'Etkinlik 20 açıklaması',
      location: 'Etkinlik 20 yeri',
      date: DateTime.now(),
      price: 2000.0
    ),
  ];

// O an kontrol yapabilelim diye
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _selectedDay;
  String? _selectedMonth;
  String? _selectedYear;
  bool _isChecked = false;

// DTO classından nasıl nesne oluşturup kullanmam gerektiğini bilemedim.
// Şimdilik bunlara atacağım girdileri form validastonu sağlanınca.
  String? firstName;
  String? lastName;
  String? phoneNumber;
  bool termsAndServicesAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Üyelik Oluştur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'Ad',
                  hintText: 'Adınızı girin',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen adınızı girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Soy Ad',
                  hintText: 'Soy adınızı girin',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen soy adınızı girin';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      hint: Text('Gün'),
                      value: _selectedDay,
                      items: List.generate(31, (index) {
                        return DropdownMenuItem<String>(
                          value: (index + 1) < 10 ? '0${index + 1}' : (index + 1).toString(),
                          child: Text((index + 1).toString()),
                        );
                      }),
                      onChanged: (value) {
                        setState(() {
                          _selectedDay = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Lütfen günü seçin';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      hint: Text('Ay'),
                      value: _selectedMonth,
                      items: List.generate(12, (index) {
                        return DropdownMenuItem<String>(
                          value: (index + 1) < 10 ? '0${index + 1}' : (index + 1).toString(),
                          child: Text((index + 1).toString()),
                        );
                      }),
                      onChanged: (value) {
                        setState(() {
                          _selectedMonth = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Lütfen ayı seçin';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      hint: Text('Yıl'),
                      value: _selectedYear,
                      items: List.generate(100, (index) {
                        int year = DateTime.now().year - index;
                        return DropdownMenuItem<String>(
                          value: year.toString(),
                          child: Text(year.toString()),
                        );
                      }),
                      onChanged: (value) {
                        setState(() {
                          _selectedYear = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Lütfen yılı seçin';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Telefon Numarası',
                  hintText: 'Telefon numaranızı girin',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                maxLength: 10,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen telefon numaranızı giriniz.';
                  }
                  if (value.length != 10 || !value.startsWith('5')) {
                    return 'Telefon numarası eksik veya hatalı.';
                  }
                  return null;
                },
              ),
              CheckboxListTile(
                title: Text('KVKK Aydınlatma Metni’ni okudum anladım.'),
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    if (_isChecked) {
                      setState(() {
                        firstName = _firstNameController.text;
                        lastName = _lastNameController.text;
                        phoneNumber = _phoneController.text;
                        termsAndServicesAccepted = _isChecked;
                      });

                      const storage = FlutterSecureStorage();

                      final String? email = await storage.read(key: 'email');

                      if (email == null) {
                        throw Exception('Email bilgisi alınamadı');
                      }

                      CustomerService customerService = CustomerService();

                      await customerService.createMe(
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        email: email,
                        dateOfBirth: '$_selectedMonth-$_selectedDay-$_selectedYear',
                        phoneNumber: _phoneController.text);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Üyelik başarıyla oluşturuldu')));

                      customerService.navigateToClientHomePage(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('KVKK Aydınlatma Metni onayı gereklidir')));
                    }
                  }
                },
                child: Text('Üyelik Oluştur'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
