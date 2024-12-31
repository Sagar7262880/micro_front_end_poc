// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:micro_front_end_poc/Bottom%20Nav%20Bar/bottom_nav_bar.dart';
import 'package:out_duty/Apply/ApplyOutDuty.dart';
import 'package:leave/apply/view/ApplyLeave.dart';
// import 'package:leave/apply/view/ApplyLeave.dart';
import '../screens/home.dart';

class AppRoutes {
  //=========================Initial Route=========================
  static const String home = '/';
  //================================================================
  static const Transition defaultTransition = Transition.fadeIn;
  static const Duration defaultDuration = Duration(milliseconds: 300);
  //================================================================

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const MyHomePage(title: "Micro front-end Demo"),
      transition: defaultTransition,
      transitionDuration: defaultDuration,
    ),
    GetPage(
      name: '/applyOutDuty',
      page: () => const ApplyOutDuty(),
      transition: defaultTransition,
      transitionDuration: defaultDuration,
    ),
    GetPage(
      name: '/applyLeave',
      page: () => const Applyleave(),
      transition: defaultTransition,
      transitionDuration: defaultDuration,
    ),
    GetPage(
      name: '/themeseting',
      page: () => ProfilePage(),
      transition: defaultTransition,
      transitionDuration: defaultDuration,
    ),
  ];
}
