import 'package:flutter/material.dart';
import '../Constant/constant_color.dart';

dynamic AppBarThemes() {
  return AppBarTheme(
      backgroundColor: Colors.white70, iconTheme: IconThemeData(color: black));
}

dynamic floatButton(bgColor) {
  return FloatingActionButtonThemeData(
    backgroundColor: bgColor,
    // Background color of the FAB in light theme
    foregroundColor: bgColor == Colors.white ? Colors.black : Colors.white,
    // Icon color inside the FAB
    elevation: 6,
    // Elevation (shadow) for the FAB
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50), // Rounded corners for the FAB
    ),
  );
}

dynamic btnElevation(bgColor, frColor) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: frColor,
      backgroundColor: bgColor,
      shape: const StadiumBorder(),
    ),
  );
}

dynamic txtTheme(colors, double fontsize) {
  return TextTheme(
    displayLarge: TextStyle(fontSize: fontsize),
    // Replaces headline1 // 32
    displayMedium: TextStyle(fontSize: fontsize - 4),
    // Replaces headline2
    displaySmall: TextStyle(fontSize: fontsize - 8),
    // Replaces headline3
    titleLarge: TextStyle(fontSize: fontsize - 12),
    // Replaces headline4
    titleMedium: TextStyle(fontSize: fontsize - 14),
    // Replaces headline5
    titleSmall: TextStyle(fontSize: fontsize - 16),
    // Replaces headline6
    bodyLarge: TextStyle(fontSize: fontsize - 14),
    // Replaces bodyText1
    bodyMedium: TextStyle(fontSize: fontsize - 16),
    // Replaces bodyText2
    bodySmall: TextStyle(fontSize: fontsize - 18),
    labelLarge: TextStyle(fontSize: fontsize - 18),
    labelMedium: TextStyle(fontSize: fontsize - 16),
    labelSmall: TextStyle(fontSize: fontsize - 14),
  );
}

/*
dynamic txtTheme(colors, double fontsize) {
  return TextTheme(
    displayLarge: TextStyle(color: colors.shade900, fontSize: fontsize),
    // Replaces headline1 // 32
    displayMedium: TextStyle(color: colors.shade800, fontSize: fontsize - 4),
    // Replaces headline2
    displaySmall: TextStyle(color: colors.shade700, fontSize: fontsize - 8),
    // Replaces headline3
    titleLarge: TextStyle(
        color: colors.shade700,
        fontSize: fontsize - 12,
        fontWeight: FontWeight.bold),
    // Replaces headline4
    titleMedium: TextStyle(color: colors.shade700, fontSize: fontsize - 14),
    // Replaces headline5
    titleSmall: TextStyle(color: colors.shade700, fontSize: fontsize - 16),
    // Replaces headline6
    bodyLarge: TextStyle(color: colors.shade600, fontSize: fontsize - 14),
    // Replaces bodyText1
    bodyMedium: TextStyle(color: colors.shade500, fontSize: fontsize - 16),
    // Replaces bodyText2
    bodySmall: TextStyle(color: colors.shade400, fontSize: fontsize - 18),
    labelLarge: TextStyle(color: colors.shade900, fontSize: fontsize - 18),
    labelMedium: TextStyle(color: colors.shade800, fontSize: fontsize - 16),
    labelSmall: TextStyle(color: colors.shade700, fontSize: fontsize - 14),
  );
}
*/

dynamic radioThemes(filColor) {
  return RadioThemeData(
    fillColor: WidgetStateProperty.all(filColor),
    // Color when radio is selected
    overlayColor: WidgetStateProperty.all(filColor.withOpacity(0.1)),
    // Color when tapped
    splashRadius: 20,
    // Size of the splash effect when tapped
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

dynamic btnTheme(btnColor) {
  return ButtonThemeData(
      buttonColor: btnColor,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.normal);
}

dynamic btnText(frColor) {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: frColor, // Text color
      shape: RoundedRectangleBorder(
          //borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
    ),
  );
}

dynamic btnOutline(btnColor) {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: btnColor, // Text color of the button
      side: BorderSide(color: btnColor, width: 2), // Border color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // Rounded corners
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 16, vertical: 12), // Padding inside button
    ),
  );
}

dynamic timeDialog() {
  return TimePickerThemeData(
    backgroundColor: Colors.white,
    hourMinuteTextColor: Colors.black,
    // Color for the hour and minute text
    hourMinuteColor: Colors.blue,
    // Background color for the hour/minute selector
    dialTextColor: Colors.black,
    // Dial text color
    dialBackgroundColor: Colors.blue.shade50,
    // Dial background color
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(16), // Rounded corners for the time picker
    ),
  );
}

dynamic cardThemes(cardColor, double cardElevation) {
  return CardTheme(
    //color: cardColor, // Card background color
    elevation: cardElevation, // Card elevation (shadow)
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // Rounded corners
    ),
  );
}

dynamic bottomTheme(selected, unSelected) {
  BottomNavigationBarThemeData(
    selectedItemColor: selected, // Selected item color
    unselectedItemColor: unSelected, // Unselected item color
    showUnselectedLabels: true, // Show labels for unselected items
    elevation: 10, // Add shadow effect
  );
}

dynamic cbTheme(borderClr, activeClr, checkClr) {
  return CheckboxThemeData(
    // Customize the checkbox's appearance
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4), // Rounded corners
    ),
    side: BorderSide(
        color: borderClr, // Checkbox border color
        width: 2),
    checkColor: WidgetStateProperty.all(checkClr),
    // Checkmark color
    fillColor: WidgetStateProperty.all(activeClr),
    // Color when checked
    splashRadius: 20,
    // Splash radius size
    overlayColor:
        WidgetStateProperty.all(Colors.blue.withOpacity(0.2)), // Ripple effect
  );
}

dynamic inputDecoration(filClr, otherClr){
  InputDecorationTheme(
    contentPadding: const EdgeInsets.all(10),
    filled: true,
    fillColor: filClr,
    // Dark background for the TextField
    // hintStyle: TextStyle(color: Colors.white60), // Hint text color (light gray)
    // labelStyle: TextStyle(color: Colors.white,), // Label text color (white)
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: otherClr, width: 0.0),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: otherClr, width: 0.0),
    ),
    focusedBorder: OutlineInputBorder(
      // borderRadius: BorderRadius.all(Radius.circular(4)),
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 0, color: otherClr),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 0, color: otherClr),
    ),
  );
}

/// ----  Red Theme  ----
ThemeData get redTheme {
  return ThemeData(
    primaryColor: red,
    appBarTheme: AppBarThemes(),
    //textTheme: const TextTheme(titleMedium: TextStyle(color: red)),
    textTheme: txtTheme(red, 32),
    buttonTheme: btnTheme(red),
    elevatedButtonTheme: btnElevation(redAccent, white),
    // Text Theme (Updated for Flutter 3.x+)
    iconTheme: const IconThemeData(color: red),
    floatingActionButtonTheme: floatButton(red),
    textButtonTheme: btnText(red),
    outlinedButtonTheme: btnOutline(red),
    cardTheme: cardThemes(red, 2),
    radioTheme: radioThemes(red),
    checkboxTheme: cbTheme(red, redAccent, white),
    // bottomNavigationBarTheme: bottomTheme(red, grey),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: red, // Icon color for light mode
        highlightColor:
            Colors.redAccent.withOpacity(0.1), // Highlight color on press
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(10),
      filled: true,
      fillColor: Colors.white,
      // Dark background for the TextField
      // hintStyle: TextStyle(color: Colors.white60), // Hint text color (light gray)
      // labelStyle: TextStyle(color: Colors.white,), // Label text color (white)
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black, width: 0.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(4)),
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 0, color: Colors.black),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 0, color: Colors.black),
      ),
    ),
  );
}

/// ----  Blue Theme  ----
ThemeData get blueTheme {
  return ThemeData(
    primaryColor: indigo,
    appBarTheme: AppBarThemes(),
    textTheme: txtTheme(indigo, 32),
    buttonTheme: btnTheme(indigo),
    elevatedButtonTheme: btnElevation(indigo, white),
    textButtonTheme: btnText(indigo),
    floatingActionButtonTheme: floatButton(indigo),
    outlinedButtonTheme: btnOutline(indigo),
    iconTheme: const IconThemeData(color: indigo),
    cardTheme: cardThemes(indigo, 2),
    radioTheme: radioThemes(indigo),
    checkboxTheme: cbTheme(indigo, indigoAccent, white),
    // bottomNavigationBarTheme: bottomTheme(indigo, grey),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: indigo, // Icon color for light mode
        highlightColor:
            Colors.indigoAccent.withOpacity(0.1), // Highlight color on press
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(10),
      filled: true,
      fillColor: Colors.white,
      // Dark background for the TextField
      // hintStyle: TextStyle(color: Colors.white60), // Hint text color (light gray)
      // labelStyle: TextStyle(color: Colors.white,), // Label text color (white)
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black, width: 0.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(4)),
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 0, color: Colors.black),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 0, color: Colors.black),
      ),
    ),
  );
}

/// ----  Orange Theme  ----
ThemeData get orangeTheme {
  return ThemeData(
    primaryColor: orange,
    appBarTheme: AppBarThemes(),
    //textTheme: const TextTheme(titleMedium: TextStyle(color: orange)),
    textTheme: txtTheme(orange, 32),
    buttonTheme: btnTheme(orange),
    elevatedButtonTheme: btnElevation(orangeAccent, white),
    floatingActionButtonTheme: floatButton(orange),
    textButtonTheme: btnText(orange),
    outlinedButtonTheme: btnOutline(orange),
    iconTheme: const IconThemeData(color: orange),
    cardTheme: cardThemes(orange, 2),
    radioTheme: radioThemes(orange),
    checkboxTheme: cbTheme(orange, orangeAccent, white),
    // bottomNavigationBarTheme: bottomTheme(orange, grey),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: Colors.orange, // Icon color for light mode
        highlightColor:
            Colors.orangeAccent.withOpacity(0.1), // Highlight color on press
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(10),
      filled: true,
      fillColor: Colors.white,
      // Dark background for the TextField
      // hintStyle: TextStyle(color: Colors.white60), // Hint text color (light gray)
      // labelStyle: TextStyle(color: Colors.white,), // Label text color (white)
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black, width: 0.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(4)),
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 0, color: Colors.black),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 0, color: Colors.black),
      ),
    ),
  );
}

/// ----  Green Theme  ----
ThemeData get greenTheme {
  return ThemeData(
    primaryColor: green,
    appBarTheme: AppBarThemes(),
    //textTheme: const TextTheme(titleMedium: TextStyle(color: green)),
    textTheme: txtTheme(green, 32),
    buttonTheme: btnTheme(green),
    elevatedButtonTheme: btnElevation(green, white),
    textButtonTheme: btnText(green),
    outlinedButtonTheme: btnOutline(green),
    iconTheme: const IconThemeData(color: green),
    floatingActionButtonTheme: floatButton(green),
    cardTheme: cardThemes(green, 2),
    radioTheme: radioThemes(green),
    checkboxTheme: cbTheme(green, green, white),
    // bottomNavigationBarTheme: bottomTheme(green, grey),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: Colors.green, // Icon color for light mode
        highlightColor:
            Colors.greenAccent.withOpacity(0.1), // Highlight color on press
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(10),
      filled: true,
      fillColor: Colors.white,
      // Dark background for the TextField
      // hintStyle: TextStyle(color: Colors.white60), // Hint text color (light gray)
      // labelStyle: TextStyle(color: Colors.white,), // Label text color (white)
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black, width: 0.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(4)),
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 0, color: Colors.black),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(width: 0, color: Colors.black),
      ),
    ),
  );
}

/// ----  Dark Theme  ----
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  // Primary color for buttons, etc.
  //accentColor: Colors.amber,  // Accent color for highlights
  scaffoldBackgroundColor: Colors.black,
  // Background color of the app
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black87, // App bar color
    iconTheme: IconThemeData(color: Colors.white),
  ),

  /*textTheme: TextTheme(
    headlineLarge: TextStyle(color: Colors.white),
    headlineMedium: TextStyle(color: Colors.white70),
    headlineSmall: TextStyle(color: Colors.white),
  ),*/

  buttonTheme: btnTheme(black),
  cardTheme: cardThemes(Colors.grey[800], 2),
  /*cardTheme: CardTheme(
    color: Colors.grey[800], // Card color
    shadowColor: Colors.black54, // Shadow color for cards
  ),*/
  iconTheme: IconThemeData(color: Colors.white70),
  floatingActionButtonTheme: floatButton(grey500),
  elevatedButtonTheme: btnElevation(grey500, white),
  textButtonTheme: btnText(white),
  outlinedButtonTheme: btnOutline(white),
  checkboxTheme: cbTheme(white, white, black),
  // bottomNavigationBarTheme: bottomTheme(white, grey),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(10),
    filled: true,
    fillColor: Colors.black,
    // Dark background for the TextField
    // hintStyle: TextStyle(color: Colors.white60), // Hint text color (light gray)
    // labelStyle: TextStyle(color: Colors.white,), // Label text color (white)
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white, width: 0.0),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white, width: 0.0),
    ),
    focusedBorder: OutlineInputBorder(
      // borderRadius: BorderRadius.all(Radius.circular(4)),
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 0, color: Colors.white),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 0, color: Colors.white),
    ),
  ),
);

final darkThemes = ThemeData(
    primaryColor: white,
    hintColor: white,
    //brightness: Brightness.light,
    dividerColor: Colors.grey,
    scaffoldBackgroundColor: black,
    cardTheme: CardTheme(
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.2),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontSize: 12.0, color: Colors.black),
      headlineLarge: TextStyle(fontSize: 16.0, color: Colors.white),
      headlineMedium: TextStyle(fontSize: 14.0, color: Colors.white),
      labelMedium: TextStyle(fontSize: 14, color: Colors.black),
      titleSmall: TextStyle(fontSize: 12.0, color: Colors.black),
      titleMedium: TextStyle(fontSize: 12.0, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 14.0, color: white),
      bodyMedium: TextStyle(
          fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(backgroundColor: black),
    //buttonColor: white,
    buttonTheme: const ButtonThemeData(
      buttonColor: white,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.normal,
      /* colorScheme: ColorScheme(
        primary: Colors.white,
        primaryVariant: Colors.white,
      ), */
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: white,
        backgroundColor: black,
        shape: const StadiumBorder(),
      ),
    ),
    iconTheme: const IconThemeData(color: white),
    listTileTheme: const ListTileThemeData(iconColor: black),
    cardColor: white,
    // backgroundColor: const Color(0xFFFFFFFF)
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFFFFFFF)));

/// ----  Light Theme  ----
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: grey,
  // Primary color for buttons, etc.
  //accentColor: Colors.amber,  // Accent color for highlights
  scaffoldBackgroundColor: Colors.white,
  // Background color of the app
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white70, // App bar color
    iconTheme: IconThemeData(color: Colors.black),
  ),

  /*textTheme: TextTheme(
    headlineLarge: TextStyle(color: Colors.black),
    headlineMedium: TextStyle(color: Colors.black70),
    headlineSmall: TextStyle(color: Colors.black),
  ),*/
  buttonTheme: btnTheme(white),
  cardTheme: cardThemes(white, 2),
  /*cardTheme: CardTheme(
    color: Colors.white,
    // Card color: plain white for a light theme
    shadowColor: Colors.grey.withOpacity(0.5),
    // Shadow color: subtle grey shadow for a soft effect
    elevation: 2, // Optional: elevation for shadow depth
  ),*/
  iconTheme: IconThemeData(
    color: Colors.black54, // Icon color
  ),
  floatingActionButtonTheme: floatButton(white),
  elevatedButtonTheme: btnElevation(white80, black),
  textButtonTheme: btnText(black),
  outlinedButtonTheme: btnOutline(black),
  checkboxTheme: cbTheme(black, black, white),
  // bottomNavigationBarTheme: bottomTheme(black, grey),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(10),
    filled: true,
    fillColor: Colors.white,
    // Dark background for the TextField
    // hintStyle: TextStyle(color: Colors.black60), // Hint text color (light gray)
    // labelStyle: TextStyle(color: Colors.black,), // Label text color (white)
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black, width: 0.0),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black, width: 0.0),
    ),
    focusedBorder: OutlineInputBorder(
      // borderRadius: BorderRadius.all(Radius.circular(4)),
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 0, color: Colors.black),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 0, color: Colors.black),
    ),
  ),
);

final lightThemes = ThemeData(
    primaryColor: white80,
    hintColor: white,
    //brightness: Brightness.light,
    dividerColor: Colors.grey,
    scaffoldBackgroundColor: white,
    cardTheme: CardTheme(
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.2),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontSize: 16.0, color: Colors.white),
      headlineLarge: TextStyle(fontSize: 16.0, color: Colors.black),
      headlineMedium: TextStyle(fontSize: 14.0, color: Colors.black),
      titleLarge: TextStyle(fontSize: 16.0, color: Colors.white),
      labelMedium: TextStyle(fontSize: 14, color: Colors.black),
      titleMedium: TextStyle(fontSize: 12.0, color: Colors.white),
      //
      labelSmall: TextStyle(fontSize: 12, color: grey),
      //
      titleSmall: TextStyle(fontSize: 12, color: black),
      //
      labelLarge: TextStyle(fontSize: 16, color: black),

      bodyLarge: TextStyle(fontSize: 14.0, color: white),
      bodyMedium: TextStyle(
          fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: white, foregroundColor: Colors.black),
    //buttonColor: white,
    buttonTheme: const ButtonThemeData(
      buttonColor: white,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.normal,
      /* colorScheme: ColorScheme(
        primary: Colors.white,
        primaryVariant: Colors.white,
      ), */
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: black,
        backgroundColor: white,
        shape: const StadiumBorder(),
      ),
    ),
    iconTheme: const IconThemeData(color: black),
    listTileTheme: const ListTileThemeData(iconColor: white),
    cardColor: white,
    // backgroundColor: const Color(0xFF000000)
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFFFFFFF)));
