import 'package:flutter/material.dart';
import 'package:micro_front_end_poc/routes/routes.dart';
import 'package:get/get.dart';
import 'package:utility/utility.dart';

import 'Bottom Nav Bar/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Infogird Demo',
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orangeAccent,
        ),
        useMaterial3: true,
        primaryColor: Colors.indigoAccent,
      ),
      home: const BottomNavBar(),
    );
  }
}
