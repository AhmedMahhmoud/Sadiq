import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferencesManager? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPreferencesManager> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferencesManager();
      await _instance!._init();
    }
    return _instance!;
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    log("set string is called $value");
    return await _preferences!.setString(key, value);
  }

  String getString(String key, {String? defaultValue}) {
    return _preferences!.getString(key) ?? defaultValue ?? "";
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences!.setBool(key, value);
  }

  bool getBool(String key, {bool? defaultValue}) {
    return _preferences!.getBool(key) ?? defaultValue ?? false;
  }

  Future<bool> setInt(String key, int value) async {
    return await _preferences!.setInt(key, value);
  }

  int getInt(String key, {int? defaultValue}) {
    return _preferences!.getInt(key) ?? defaultValue ?? 0;
  }

  Future<bool> setDouble(String key, double value) async {
    return await _preferences!.setDouble(key, value);
  }

  Future<bool> remove(String key) async {
    return await _preferences!.remove(key);
  }

  Future<bool> clear() async {
    return await _preferences!.clear();
  }
}
