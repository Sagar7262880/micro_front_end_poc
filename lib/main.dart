import 'package:flutter/material.dart';
import 'package:micro_front_end_poc/routes/routes.dart';
import 'package:get/get.dart';
import 'package:utility/utility.dart';

import 'Bottom Nav Bar/bottom_nav_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedService.initialize();
  // DioService.initializeDio();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GetMaterialApp(
            title: 'Infogird Demo Mac',
            initialRoute: AppRoutes.home,
            getPages: AppRoutes.routes,
            theme: themeController.themeData, // Reactively set theme
            home: BottomNavBar());
      },
    );
    /* return GetMaterialApp(
      title: 'Infogird Demo Mac',
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orangeAccent,
        ),
        useMaterial3: true,
        primaryColor: Colors.orangeAccent,
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              // Theme.of(context).cardColor,
              Colors.orangeAccent,
            ),
          ),
        ),
      ),
      home: const BottomNavBar(),
    );*/
  }
}
