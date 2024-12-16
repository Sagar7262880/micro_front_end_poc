// ignore_for_file: depend_on_referenced_packages

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:micro_front_end_poc/screens/home.dart';
import 'package:leave/apply/view/ApplyLeave.dart';
import 'package:geo_fencing/fencing/BackgroundGeoServiceView.dart';
import 'package:utility/utility.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _bottomNavIndex = 0; // Current active index

  // List of icons for the navigation bar
  final List<IconData> iconList = [
    HugeIcons.strokeRoundedHome01,
    HugeIcons.strokeRoundedAbacus,
    HugeIcons
        .strokeRoundedDashboardSquare01, // Icon for the Apply Leave functionality
    HugeIcons.strokeRoundedLocation01,
    HugeIcons.strokeRoundedSearchList01,
  ];

  // List of navigation labels
  final List<String> labels = [
    "Home",
    "Something",
    "Apply Leave",
    "Geo Fencing",
    "Profile"
  ];

  // List of pages for navigation
  final List<Widget> pages = [
    const MyHomePage(title: "Infogird POC"),
    const SearchPage(),
    const Applyleave(),
    const Backgroundgeoserviceview(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color =
                isActive ? Theme.of(context).dividerColor : Colors.grey;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconList[index], size: 18.0, color: color),
                const SizedBox(height: 4.0),
                Text(
                  labels[index],
                  style: TextStyle(color: color, fontSize: 12.0),
                ),
              ],
            );
          },
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation
              .none, // Remove the center gap for floating action button
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          height: height / 9.99 - 10,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

// Example pages for navigation
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home Page"));
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Search Page"));
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Favorites Page"));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile Page"));
  }
}
