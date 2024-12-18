import 'package:flutter/material.dart';
import '../Constant/constant_color.dart';

/// ----  Red Theme  ----

ThemeData get redTheme {
  return ThemeData(
    primaryColor: red,
    appBarTheme: const AppBarTheme(backgroundColor: red),
    //textTheme: const TextTheme(titleMedium: TextStyle(color: red)),
    buttonTheme: const ButtonThemeData(
        buttonColor: red,
        shape: RoundedRectangleBorder(),
        textTheme: ButtonTextTheme.normal),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: white,
        backgroundColor: red,
        shape: const StadiumBorder(),
      ),
    ),
    // Text Theme (Updated for Flutter 3.x+)
    //textTheme: txtTheme(red, 32),
    iconTheme: const IconThemeData(color: red),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(10),
      filled: true,
      fillColor: Colors.white, // Dark background for the TextField
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

dynamic txtTheme(colors, double fontsize) {
  return TextTheme(
    displayLarge: TextStyle(
        color: colors.shade900, fontSize: fontsize), // Replaces headline1 // 32
    displayMedium: TextStyle(
        color: colors.shade800, fontSize: fontsize - 4), // Replaces headline2
    displaySmall: TextStyle(
        color: colors.shade700, fontSize: fontsize - 8), // Replaces headline3
    titleLarge: TextStyle(
        color: colors.shade700,
        fontSize: fontsize - 12,
        fontWeight: FontWeight.bold), // Replaces headline4
    titleMedium: TextStyle(
        color: colors.shade700, fontSize: fontsize - 14), // Replaces headline5
    titleSmall: TextStyle(
        color: colors.shade700, fontSize: fontsize - 16), // Replaces headline6
    bodyLarge: TextStyle(
        color: colors.shade600, fontSize: fontsize - 14), // Replaces bodyText1
    bodyMedium: TextStyle(
        color: colors.shade500, fontSize: fontsize - 16), // Replaces bodyText2
    bodySmall: TextStyle(color: colors.shade400, fontSize: fontsize - 18),
    labelLarge: TextStyle(color: colors.shade900, fontSize: fontsize - 18),
    labelMedium: TextStyle(color: colors.shade800, fontSize: fontsize - 16),
    labelSmall: TextStyle(color: colors.shade700, fontSize: fontsize - 14),
  );
}

/// ----  Blue Theme  ----

ThemeData get blueTheme {
  return ThemeData(
    primaryColor: blue,
    appBarTheme: const AppBarTheme(backgroundColor: blue),
    //textTheme: const TextTheme(titleMedium: TextStyle(color: blue)),
    textTheme: txtTheme(blue, 32),
    buttonTheme: const ButtonThemeData(
        buttonColor: blue,
        shape: RoundedRectangleBorder(),
        textTheme: ButtonTextTheme.normal),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          foregroundColor: white,
          backgroundColor: blue,
          shape: const StadiumBorder()),
    ),
    iconTheme: const IconThemeData(color: blue),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(10),
      filled: true,
      fillColor: Colors.white, // Dark background for the TextField
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
    appBarTheme: const AppBarTheme(backgroundColor: orange),
    //textTheme: const TextTheme(titleMedium: TextStyle(color: orange)),
    textTheme: txtTheme(orange, 32),
    buttonTheme: const ButtonThemeData(
        buttonColor: orange,
        shape: RoundedRectangleBorder(),
        textTheme: ButtonTextTheme.normal),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: white,
        backgroundColor: orange,
        shape: const StadiumBorder(),
      ),
    ),
    iconTheme: const IconThemeData(color: orange),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(10),
      filled: true,
      fillColor: Colors.white, // Dark background for the TextField
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
    appBarTheme: const AppBarTheme(backgroundColor: green),
    //textTheme: const TextTheme(titleMedium: TextStyle(color: green)),
    textTheme: txtTheme(green, 32),
    buttonTheme: const ButtonThemeData(
        buttonColor: green,
        shape: RoundedRectangleBorder(),
        textTheme: ButtonTextTheme.normal),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          foregroundColor: white,
          backgroundColor: green,
          shape: const StadiumBorder()),
    ),
    iconTheme: const IconThemeData(color: green),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(10),
      filled: true,
      fillColor: Colors.white, // Dark background for the TextField
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
  primaryColor: Colors.blueAccent, // Primary color for buttons, etc.
  //accentColor: Colors.amber,  // Accent color for highlights
  scaffoldBackgroundColor: Colors.black, // Background color of the app
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black87, // App bar color
    iconTheme: IconThemeData(color: Colors.white),
  ),

  /*textTheme: TextTheme(
    headlineLarge: TextStyle(color: Colors.white),
    headlineMedium: TextStyle(color: Colors.white70),
    headlineSmall: TextStyle(color: Colors.white),
  ),*/

  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blueAccent, // Button color
    textTheme: ButtonTextTheme.primary,
  ),
  cardTheme: CardTheme(
    color: Colors.grey[800], // Card color
    shadowColor: Colors.black54, // Shadow color for cards
  ),
  iconTheme: IconThemeData(
    color: Colors.white70, // Icon color
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(10),
    filled: true,
    fillColor: Colors.black, // Dark background for the TextField
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
  primaryColor: Colors.blueAccent, // Primary color for buttons, etc.
  //accentColor: Colors.amber,  // Accent color for highlights
  scaffoldBackgroundColor: Colors.white, // Background color of the app
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white70, // App bar color
    iconTheme: IconThemeData(color: Colors.black),
  ),

  /*textTheme: TextTheme(
    headlineLarge: TextStyle(color: Colors.black),
    headlineMedium: TextStyle(color: Colors.black70),
    headlineSmall: TextStyle(color: Colors.black),
  ),*/
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blueAccent, // Button color
    textTheme: ButtonTextTheme.primary,
  ),
  cardTheme: CardTheme(
    color: Colors.white, // Card color: plain white for a light theme
    shadowColor: Colors.grey.withOpacity(0.5), // Shadow color: subtle grey shadow for a soft effect
    elevation: 2, // Optional: elevation for shadow depth
  ),
  iconTheme: IconThemeData(
    color: Colors.black54, // Icon color
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(10),
    filled: true,
    fillColor: Colors.white, // Dark background for the TextField
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
    primaryColor: white,
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


