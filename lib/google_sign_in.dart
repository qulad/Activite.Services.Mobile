import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId:
      "139947361694-thcg10c74d09p8kje9qg478fjhmdtjia.apps.googleusercontent.com",
);

Future<void> googleLogin(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();

    if (googleAccount == null) {
      // Kullanıcı giriş yapmayı iptal etti
      return;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleAccount.authentication;
    String accessToken = googleAuth.accessToken!;

    // Backend'e token'i gonder
  } catch (error) {
    print("Hata oluştu: $error");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text("Giriş sırasında bir hata oluştu. Tekrar deneyin.")),
    );
  }
}
