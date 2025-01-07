import 'package:flutter/material.dart';
import 'package:micro_front_end_poc/attendance/view/attendance_list.dart';
import 'package:micro_front_end_poc/screens/dashboard.dart';
import 'package:leave/apply/view/ApplyLeave.dart';
import 'package:utility/utility.dart';
import '../screens/home.dart';
import '../screens/socket_example.dart';
import '../setting/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _bottomNavIndex = 0; // Current active index
  final ThemeController themeController = Get.find<ThemeController>();
  // List of pages for navigation
  final List<Widget> pages = [
    // const MyHomePage(title: "Infogird POC"),
    const Dashboard(),
    //StockMarketPage(),
    SocketExample(
      title: '',
    ),
    //const Applyleave(),
    const AttendanceList(),
    const MyHomePage(title: "Infogird POC"),
    // const SearchPage(),
    // // const Applyleave(),
    // const GglMaps(),
    // const Backgroundgeoserviceview(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_bottomNavIndex == 0) {
          return true;
        } else {
          // setState(() {
          //   _bottomNavIndex=0;
          // });
          Get.offAllNamed("/");
        }
        return false;
      },
      child: Scaffold(
        body: pages[_bottomNavIndex], // Display the selected page
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: themeController.currentColor.value == "dr"
              ? Colors.grey[900]
              : Colors.white,
          elevation: 0,
          currentIndex: _bottomNavIndex,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index; // Update the selected index
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          showUnselectedLabels: true,
          mouseCursor: SystemMouseCursors.none,
          items: List.generate(5, (index) {
            final bool isSelected = _bottomNavIndex == index;
            return BottomNavigationBarItem(
              icon: isSelected
                  ? Container(
                      width: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        _getIconForIndex(index, true),
                      ),
                    )
                  : Icon(
                      _getIconForIndex(index, false),
                    ),
              label: _getLabelForIndex(index),
            );
          }),
        ),
      ),
    );
  }
}

IconData _getIconForIndex(int index, bool isSelected) {
  switch (index) {
    case 0:
      return isSelected ? Icons.home : Icons.home_outlined;
    case 1:
      return isSelected
          ? Icons.event_available
          : Icons.event_available_outlined;
    case 2:
      return isSelected ? Icons.menu : Icons.menu_outlined;
    case 3:
      return isSelected ? Icons.person : Icons.person_outline;
    case 4:
      return isSelected ? Icons.settings : Icons.settings_outlined;
    default:
      return isSelected ? Icons.home : Icons.home_outlined;
  }
}

String _getLabelForIndex(int index) {
  switch (index) {
    case 0:
      return "Home";
    case 1:
      return "Event";
    case 2:
      return "Menu";
    case 3:
      return "Profile";
    case 4:
      return "Setting";
    default:
      return "";
  }
}
