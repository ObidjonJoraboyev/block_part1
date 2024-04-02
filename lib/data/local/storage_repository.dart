import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  static final StorageRepository instance = StorageRepository._();
  static SharedPreferences? _preference;

  StorageRepository._();

  factory StorageRepository() => instance;

  static Future<void> init() async {
    _preference = await SharedPreferences.getInstance();
  }

  static Future<void> setString({
    required String key,
    required String values,
  }) async {
    if (_preference != null) {
      debugPrint("SAVING STRING:$values");
      _preference!.setString(key, values);
    }
  }

  static Future<void> setBool({
    required String key,
    required bool value,
  }) async {
    if (_preference != null) {
      debugPrint("SAVING BOOL:$value");
      _preference!.setBool(key, value);
    }
  }

  static String getString({required String key}) {
    if (_preference != null) {
      return _preference!.getString(key) ?? "";
    }
    return "";
  }

  static bool getBool({required String key}) {
    if (_preference != null) {
      return _preference!.getBool(key) ?? false;
    }
    return false;
  }
}
