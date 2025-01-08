import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

Future<bool> googleRegister(BuildContext context) async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    if (account != null) {
      // Kullanıcı başarılı şekilde kayıt oldu
      print('Kayıt başarılı: ${account.email}');
      return true;
    } else {
      // Kullanıcı kayıt işlemini iptal etti
      return false;
    }
  } catch (e) {
    print('Google ile kayıt hatası: $e');
    return false;
  }
}
