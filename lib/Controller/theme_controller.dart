import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:micro_front_end_poc/Controller/theme_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constant/constant_color.dart';

class ThemeController extends GetxController {
  var isDarkMode = 'l'.obs; // 'l' = Light mode, 'd' = Dark mode
  var currentColor =
      'lt'.obs; // Will store the current color theme ('r', 'b', etc.)

  @override
  void onInit() {
    super.onInit();
    _loadTheme();

    darkTheme.copyWith(inputDecorationTheme: InputDecorationTheme());
  }

  // Load the saved theme preference (if any)
  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode.value =
        prefs.getString('isDarkMode') ?? 'l'; // Default is light mode
    currentColor.value =
        prefs.getString('currentColor') ?? 'lt'; // Default is no color
  }

  // Save theme and color to SharedPreferences
  Future<void> saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('isDarkMode', isDarkMode.value);
    prefs.setString('currentColor', currentColor.value);
  }

  // Toggle the theme between dark and light mode
  void toggleTheme(strTheme) {
    if (strTheme == "l" || strTheme == "d") {
      isDarkMode.value = strTheme;
      currentColor.value = "";
    } else {
      currentColor.value = strTheme; // Set the selected color theme
    }
    saveTheme();
  }

  // Get the current theme data based on isDarkMode and selected color
  ThemeData get themeData {
    print("isDarkMode.value");
    print(isDarkMode.value);
    print(currentColor.value);
    if (isDarkMode.value == "d") {
      return ThemeData.dark(); // Dark theme
    } else {
      // Light theme, add color change logic here
      switch (currentColor.value) {
        case 'r':
          return redTheme; // Red theme
        case 'g':
          return greenTheme; // Green theme
        case 'b':
          return blueTheme; // Blue theme
        case 'o':
          return orangeTheme; // Orange theme
        case 'dr':
          return darkTheme; // Dark theme
        case 'lt':
          return lightTheme; // Light theme
        default:
          return ThemeData.light(); // Default light theme
      }
    }
  }

  Color getColor() {
    switch (currentColor.value) {
      case 'r':
        return red;
      case 'g':
        return green;
      case 'b':
        return blue;
      case 'o':
        return orange;
      default:
        return white; // Default color if none selected
    }
  }
}
