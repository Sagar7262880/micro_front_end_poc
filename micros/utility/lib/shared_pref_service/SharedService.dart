import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  // Singleton instance
  static final SharedService _instance = SharedService._internal();
  static SharedPreferences? _preferences;

  // Private constructor to enforce singleton pattern
  SharedService._internal() {
    log("SharedService: Private constructor called.");
    SharedService.initialize();
  }

  // Factory constructor to return the singleton instance
  factory SharedService() {
    log("SharedService: Factory constructor called.");
    return _instance;
  }

  // Initialization method (call before using SharedService)
  static Future<void> initialize() async {
    log("SharedService: Initializing SharedPreferences...");
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
      log("SharedService: SharedPreferences initialized.");
    } else {
      log("SharedService: SharedPreferences already initialized.");
    }
  }

  // Getter for SharedPreferences instance
  SharedPreferences get _prefs {
    log("SharedService: Accessing SharedPreferences instance...");
    if (_preferences == null) {
      log("SharedService: SharedPreferences not initialized. Throwing exception.");
      throw Exception(
          "SharedService is not initialized. Call SharedService.initialize() before using it.");
    }
    return _preferences!;
  }

  String getUsername({String? key}) {
    log("SharedService: Getting username with key '${key ?? "username"}'.");
    return _prefs.getString(key ?? "username") ?? "";
  }

  String getToken({String? key}) {
    log("SharedService: Getting access token with key '${key ?? "accessToken"}'.");
    return _prefs.getString(key ?? "accessToken") ?? "";
  }

  String getRefreshToken({String? key}) {
    log("SharedService: Getting refresh token with key '${key ?? "refreshToken"}'.");
    return _prefs.getString(key ?? "refreshToken") ?? "";
  }

  String getUserid({String? key}) {
    log("SharedService: Getting user ID with key '${key ?? "userId"}'.");
    return _prefs.getString(key ?? "userId") ?? "";
  }

  // Setter for String
  Future<bool> setString(String key, String value) async {
    log("SharedService: Setting string value for key '$key'.");
    bool result = await _prefs.setString(key, value);
    return result;
  }

  // Getter for String
  String? getString(String key) {
    log("SharedService: Getting string value for key '$key'.");
    return _prefs.getString(key);
  }

  // Setter for Integer
  Future<bool> setInt(String key, int value) async {
    log("SharedService: Setting integer value for key '$key'.");
    bool result = await _prefs.setInt(key, value);
    return result;
  }

  // Getter for Integer
  int? getInt(String key) {
    log("SharedService: Getting integer value for key '$key'.");
    return _prefs.getInt(key);
  }

  // Setter for Boolean
  Future<bool> setBool(String key, bool value) async {
    log("SharedService: Setting boolean value for key '$key'.");
    bool result = await _prefs.setBool(key, value);
    return result;
  }

  // Getter for Boolean
  bool? getBool(String key) {
    log("SharedService: Getting boolean value for key '$key'.");
    return _prefs.getBool(key);
  }

  // Setter for Double
  Future<bool> setDouble(String key, double value) async {
    log("SharedService: Setting double value for key '$key'.");
    bool result = await _prefs.setDouble(key, value);
    return result;
  }

  // Getter for Double
  double? getDouble(String key) {
    log("SharedService: Getting double value for key '$key'.");
    return _prefs.getDouble(key);
  }

  // Remove a specific key
  Future<bool> remove(String key) async {
    log("SharedService: Removing value for key '$key'.");
    bool result = await _prefs.remove(key);
    return result;
  }

  // Clear all preferences
  Future<bool> clear() async {
    log("SharedService: Clearing all preferences...");
    bool result = await _prefs.clear();
    return result;
  }
}
