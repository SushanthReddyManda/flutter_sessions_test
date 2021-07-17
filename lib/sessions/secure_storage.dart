import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _keyUsername = 'username';
  static const _keyToken = 'token';
  static const _keyInstituteCode = 'instituteCode';

  static Future setUsername(String username) async =>
      await _storage.write(key: _keyUsername, value: username);

  static Future<String?> getUsername() async =>
      await _storage.read(key: _keyUsername);

  static Future setToken(String token) async =>
      await _storage.write(key: _keyToken, value: token);

  static Future<String?> getToken() async =>
      await _storage.read(key: _keyToken);

  static Future setInstituteCode(String instituteCode) async =>
      await _storage.write(key: _keyInstituteCode, value: instituteCode);

  static Future<String?> getInstituteCode() async =>
      await _storage.read(key: _keyInstituteCode);
}
