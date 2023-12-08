import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static bool keyIsLogin = false;
  static const String keyNikName = "nik_name";
  static const String keyName = "name";
  static const String keyFirstName = "first_name";

  static Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  static Future<bool?> getIsLogin() async {
    final prefs = await _prefs;
    return prefs.getBool(keyIsLogin as String);
  }

  static Future<void> setIsLogin(bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(keyIsLogin as String, false);
  }

  static Future<String?> getNikName() async {
    final prefs = await _prefs;
    return prefs.getString(keyNikName);
  }

  static Future<void> setNikName(String? value) async {
    final prefs = await _prefs;
    await prefs.setString(keyNikName, value ?? "");
  }

  static Future<String?> getName() async {
    final prefs = await _prefs;
    return prefs.getString(keyName);
  }

  static Future<void> setName(String? value) async {
    final prefs = await _prefs;
    await prefs.setString(keyName, value ?? "");
  }

  static Future<String?> getFirstName() async {
    final prefs = await _prefs;
    return prefs.getString(keyFirstName);
  }

  static Future<void> setFirstName(String? value) async {
    final prefs = await _prefs;
    await prefs.setString(keyFirstName, value ?? "");
  }
}
