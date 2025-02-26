import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences? get instance => _prefs;

  //  Data Setter & Getter
  setInitializeState(bool value) => _prefs.setBool("isInitialize", value);
  bool get isInitialize => _prefs.getBool("isInitialize") ?? false;

  //  Data Setter & Getter
  setOnBoard(bool json) => _prefs.setBool("on_board", json);
  get onBoard => _prefs.getBool("on_board");

  //  Data Setter & Getter
  setCompletePercent(String json) =>
      _prefs.setString("profile_completeness", json);
  get profileCompleteness => _prefs.getBool("profile_completeness");

  // Api Token Setter & Getter
  setApiToken(String json) => _prefs.setString("api_token", json);
  get apiToken => _prefs.getString("api_token");

  // FCM Token Setter & Getter
  setFCMToken(String json) => _prefs.setString("fcm_token", json);
  get fcmToken => _prefs.getString("fcm_token");

  // User Setter & Getter
  setUser(Map<String, dynamic> val) =>
      _prefs.setString("user", jsonEncode(val));


  String? get user => _prefs.getString("user");

  removeApiToken() => _prefs.remove('api_token');

  clearUser() => _prefs.remove("user");

  flushValue(String key) {
    _prefs.remove(key);
  }


  flushAll() async {
    await _prefs.remove("user");
    await _prefs.remove("api_token");
    // await _box.erase();
  }
}