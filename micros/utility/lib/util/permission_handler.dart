import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  /// Requests location permission
  static Future<bool> requestLocationPermission() async {
    return await requestPermission(Permission.location);
  }

  /// Requests camera permission
  static Future<bool> requestCameraPermission() async {
    return await requestPermission(Permission.camera);
  }

  /// Requests microphone permission
  static Future<bool> requestMicrophonePermission() async {
    return await requestPermission(Permission.microphone);
  }

  /// Requests contacts permission
  static Future<bool> requestContactsPermission() async {
    return await requestPermission(Permission.contacts);
  }

  /// Requests storage permission
  static Future<bool> requestStoragePermission() async {
    return await requestPermission(Permission.storage);
  }

  /// Generic method for requesting any permission
  static Future<bool> requestPermission(Permission permission) async {
    var status = await permission.status;

    if (status.isGranted) {
      return true;
    }
    // Request permission if not granted
    status = await permission.request();

    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      // Re-request if denied
      status = await permission.request();
      return status.isGranted;
    } else if (status.isPermanentlyDenied) {
      // Show dialog if permanently denied
      showCustomSettingsDialog(
        permission: permission,
        title: "Permission Required",
        message:
            "The ${permission.toString().split('.').last} permission is necessary. Please enable it in settings.",
      );
      return false;
    }

    return false;
  }

  /// Requests multiple permissions
  static Future<bool> requestMultiplePermissions(
      List<Permission> permissions) async {
    Map<Permission, PermissionStatus> statuses = await permissions.request();
    bool allGranted = statuses.values.every((status) => status.isGranted);
    if (!allGranted) {
      if (statuses.values.any((status) => status.isPermanentlyDenied)) {
        showCustomSettingsDialog(
          title: "Permissions Required",
          message:
              "Some permissions are permanently denied. Please enable them in settings.",
        );
        return false;
      }
      await permissions.request();
    }

    return statuses.values.every((status) => status.isGranted);
  }

  /// Customizable dialog for opening app settings
  static void showCustomSettingsDialog({
    Permission? permission,
    required String title,
    required String message,
  }) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      textConfirm: "Open Settings",
      textCancel: "Cancel",
      onConfirm: () async {
        await openAppSettings();
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }
}

// Example usage
// bool isGranted = await PermissionManager.requestCameraPermission();
