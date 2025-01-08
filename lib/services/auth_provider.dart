// auth_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  final _storage = FlutterSecureStorage();
  String? _token;

  String? get token => _token;

  Future<void> setToken(String token) async {
    _token = token;
    await _storage.write(key: 'jwt', value: token);
    notifyListeners();
  }

  Future<void> loadToken() async {
    _token = await _storage.read(key: 'jwt');
    notifyListeners();
  }

  Future<void> logout() async {
    _token = null;
    await _storage.delete(key: 'jwt');
    notifyListeners();
  }

  bool get isAuthenticated => _token != null;
}
