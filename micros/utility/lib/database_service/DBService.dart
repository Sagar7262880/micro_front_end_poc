import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:utility/database_service/DBBox.dart' as box;

/// Enum for Box names

class DBService {
  static final DBService _instance = DBService._internal();

  DBService._internal() {
    initialize();
  }

  factory DBService() {
    return _instance;
  }

  /// Converts `Box` enum to string for Hive box names
  String _boxName(box.Box box) => box.name;

// DBSetvice();
  /// Initialize Hive
  Future<void> initialize() async {
    log("DBService: Initializing Hive...");
    await Hive.initFlutter();
    log("DBService: Hive initialized successfully.");
  }

  /// Ensure the box is open before performing operations
  Future<void> _ensureBoxOpen(box.Box box) async {
    final boxName = _boxName(box);
    if (!Hive.isBoxOpen(boxName)) {
      log("DBService: Box '$boxName' is not open. Opening now...");
      await Hive.openBox(boxName);
      log("DBService: Box '$boxName' opened successfully.");
    }
  }

  /// Add or update a value in a box
  Future<void> putValue(box.Box box, String key, dynamic value) async {
    try {
      await _ensureBoxOpen(box);
      final boxName = _boxName(box);
      log("DBService: Adding/Updating value for key '$key' in box '$boxName'...");
      final hiveBox = Hive.box(boxName);
      hiveBox.put(key, value);
      log("DBService: Value for key '$key' in box '$boxName' updated successfully.");
    } catch (e, stackTrace) {
      log("DBService: Error in putValue operation: $e",
          error: e, stackTrace: stackTrace);
    }
  }

  /// Retrieve a value from a box
  Future<dynamic> getValue(box.Box box, String key,
      {dynamic defaultValue}) async {
    try {
      await _ensureBoxOpen(box);
      final boxName = _boxName(box);
      log("DBService: Retrieving value for key '$key' from box '$boxName'...");
      final hiveBox = Hive.box(boxName);
      final value = hiveBox.get(key, defaultValue: defaultValue);
      log("DBService: Retrieved value for key '$key': $value.");
      return value;
    } catch (e, stackTrace) {
      log("DBService: Error in getValue operation: $e",
          error: e, stackTrace: stackTrace);
      return defaultValue;
    }
  }

  /// Remove a value from a box
  Future<void> removeValue(box.Box box, String key) async {
    try {
      await _ensureBoxOpen(box);
      final boxName = _boxName(box);
      log("DBService: Removing value for key '$key' from box '$boxName'...");
      final hiveBox = Hive.box(boxName);
      await hiveBox.delete(key);
      log("DBService: Value for key '$key' removed from box '$boxName'.");
    } catch (e, stackTrace) {
      log("DBService: Error in removeValue operation: $e",
          error: e, stackTrace: stackTrace);
    }
  }

  /// Clear all data in a box
  Future<void> clearBox(box.Box box) async {
    try {
      await _ensureBoxOpen(box);
      final boxName = _boxName(box);
      log("DBService: Clearing all data in box '$boxName'...");
      final hiveBox = Hive.box(boxName);
      await hiveBox.clear();
      log("DBService: Box '$boxName' cleared successfully.");
    } catch (e, stackTrace) {
      log("DBService: Error in clearBox operation: $e",
          error: e, stackTrace: stackTrace);
    }
  }

  /// Close a box
  Future<void> closeBox(box.Box box) async {
    try {
      final boxName = _boxName(box);
      if (Hive.isBoxOpen(boxName)) {
        log("DBService: Closing box '$boxName'...");
        await Hive.box(boxName).close();
        log("DBService: Box '$boxName' closed successfully.");
      } else {
        log("DBService: Box '$boxName' is not open, nothing to close.");
      }
    } catch (e, stackTrace) {
      log("DBService: Error in closeBox operation: $e",
          error: e, stackTrace: stackTrace);
    }
  }

  /// Close Hive completely
  Future<void> closeHive() async {
    try {
      log("DBService: Closing all boxes and Hive...");
      await Hive.close();
      log("DBService: Hive closed successfully.");
    } catch (e, stackTrace) {
      log("DBService: Error in closeHive operation: $e",
          error: e, stackTrace: stackTrace);
    }
  }
}
