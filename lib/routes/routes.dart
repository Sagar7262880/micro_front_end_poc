import 'package:get/get.dart';
import 'package:out_duty/Apply/ApplyOutDuty.dart';
import 'package:leave/apply/ApplyLeave.dart';
import '../main.dart';

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
  ];
}
