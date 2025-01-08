import 'package:flutter/material.dart';

class UserSettingsPage extends StatefulWidget {
  @override
  _UserSettingsPageState createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  bool isEditing = false;
  TextEditingController nameController =
      TextEditingController(text: "Ayşe Yılmaz");
  TextEditingController bioController =
      TextEditingController(text: "Gezmeyi severim ve öğrenciyim");
  TextEditingController passwordController = TextEditingController();
  String location = "Bayraklı, İzmir";
  String phoneNumber = "+90 5123456789";

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Hesap ayarları',
          style: TextStyle(
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: Color(0xFFC62038),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Frame
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isEditing)
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(hintText: "Ad Soyad"),
                        )
                      else
                        Text(
                          nameController.text,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.grey),
                  onPressed: toggleEditing,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Settings List
            buildSettingsTile(
              iconPath: 'assets/lock.png',
              title: 'Şifre',
              content: passwordController.text.isEmpty ? "*****" : "*****",
              onEdit: isEditing
                  ? () {
                      setState(() {
                        passwordController.clear();
                      });
                    }
                  : null,
            ),
            buildSettingsTile(
              iconPath: 'assets/info.png',
              title: 'Hakkımda',
              content: bioController.text,
              onEdit: isEditing
                  ? () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Hakkımda Düzenle"),
                            content: TextField(
                              controller: bioController,
                              maxLines: 3,
                            ),
                            actions: [
                              TextButton(
                                child: Text("Kaydet"),
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  : null,
            ),
            buildSettingsTile(
              iconPath: 'assets/location.png',
              title: 'Konum',
              content: location,
              onEdit: isEditing
                  ? () {
                      setState(() {
                        location = "Yeni Konum: İzmir, Türkiye"; // Mock update
                      });
                    }
                  : null,
            ),
            buildSettingsTile(
              iconPath: 'assets/phone.png',
              title: 'Telefon numarası',
              content: phoneNumber,
              onEdit: isEditing
                  ? () {
                      setState(() {
                        phoneNumber = "+90 5551234567"; // Mock update
                      });
                    }
                  : null,
            ),
            buildSettingsTile(
              iconPath: 'assets/mail.png',
              title: 'E-posta adresi',
              content: "kullanici@example.com",
              onEdit: null,
            ),
            ListTile(
              leading:
                  Image.asset('assets/sign_out.png', width: 24, height: 24),
              title: Text(
                'Çıkış Yap',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF333333),
                ),
              ),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
            ),

            if (isEditing)
              Container(
                margin: const EdgeInsets.only(top: 16),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Kaydet"),
                  onPressed: () {
                    toggleEditing();
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsTile({
    required String iconPath,
    required String title,
    required String content,
    VoidCallback? onEdit,
  }) {
    return ListTile(
      leading: Image.asset(iconPath, width: 24, height: 24),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Color(0xFF333333),
        ),
      ),
      subtitle: Text(
        content,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Color(0xFF333333),
        ),
      ),
      trailing: onEdit != null
          ? IconButton(
              icon: Icon(Icons.edit, color: Colors.grey),
              onPressed: onEdit,
            )
          : null,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
