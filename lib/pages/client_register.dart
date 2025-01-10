import 'package:deneme/services/customer_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ClientRegisterPage extends StatefulWidget {
  @override
  _ClientRegisterPageState createState() => _ClientRegisterPageState();
}

class _ClientRegisterPageState extends State<ClientRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  String? _selectedDay;
  String? _selectedMonth;
  String? _selectedYear;
  bool _isChecked = false;

// DTO classından nasıl nesne oluşturup kullanmam gerektiğini bilemedim.
// Şimdilik bunlara atacağım girdileri form validastonu sağlanınca.
  String? FirstName;
  String? LastName;
  String? PhoneNumber;
  bool TermsAndServicesAccepted = false;

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
                        FirstName = _firstNameController.text;
                        LastName = _lastNameController.text;
                        PhoneNumber = _phoneController.text;
                        TermsAndServicesAccepted = _isChecked;
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
