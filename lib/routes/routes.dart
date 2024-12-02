import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_page/second_page.dart';

import '../main.dart';

class AppRoutes {
  //Initial Route
  static const String home = '/';
  //================================================================
  static const Transition defaultTransition = Transition.fadeIn;
  static const Duration defaultDuration = Duration(milliseconds: 300);
  //================================================================

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const MyHomePage(title: 'POC Demo'),
      transition: defaultTransition,
      transitionDuration: defaultDuration,
    ),
    GetPage(
      name: '/SecondScreen',
      page: () => const SecondPage(),
      transition: defaultTransition,
      transitionDuration: defaultDuration,
    ),
    GetPage(
      name: '/ThirdScreen',
      page: () => const SecondPage(),
      transition: defaultTransition,
      transitionDuration: defaultDuration,
    ),
  ];
}
