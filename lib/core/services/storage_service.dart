// lib/core/services/shared_preferences_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences _preferences;

  StorageService(this._preferences);

  static const String _keyUsername = 'username';
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _fcmToken = 'fcm_token';

  Future<void> setUsername(String username) async {
    await _preferences.setString(_keyUsername, username);
  }

  String? get getUsername => _preferences.getString(_keyUsername);

  Future<void> setFCMToken(String token) async {
    await _preferences.setString(_fcmToken, token);
  }

  String? get getFCMToken => _preferences.getString(_fcmToken);

  Future<void> setLoginStatus(bool isLoggedIn) async {
    await _preferences.setBool(_keyIsLoggedIn, isLoggedIn);
  }

  bool isLoggedIn() {
    return _preferences.getBool(_keyIsLoggedIn) ?? false;
  }

  Future<void> clear() async {
    await _preferences.clear();
  }
}
