import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:get/get.dart'; // For Get.toNamed()
import 'package:micro_front_end_poc/screens/home.dart';
import 'package:leave/apply/ApplyLeave.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _bottomNavIndex = 0; // Current active index
  // bool isFloating = false;

  // List of icons for the navigation bar
  final List<IconData> iconList = [
    HugeIcons.strokeRoundedHome01,
    HugeIcons.strokeRoundedAbacus,
    HugeIcons.strokeRoundedUserStatus,
    HugeIcons.strokeRoundedSearchList01,
  ];

  // List of navigation labels
  final List<String> labels = ["Home", "Something", "Favorites", "Profile"];

  // List of pages for navigation
  final List<Widget> pages = [
    const MyHomePage(title: "Infogird POC"),
    const SearchPage(),
    // const FavoritesPage(),
    const Applyleave(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_bottomNavIndex], // Display the selected page
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to "/"
          // Get.toNamed("/applyLeave");
          Get.to(() => Applyleave());
        },
        child: const Icon(
          HugeIcons.strokeRoundedDashboardSquare01,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Theme.of(context).dividerColor : Colors.grey;
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
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(
            () => _bottomNavIndex = index,
          );
          // if (index == 0) {
          //   // Handle specific navigation logic for index 0
          //   // Get.toNamed("/");
          //   // Get.toNamed("/applyLeave");
          //   setState(() {
          //     isFloating = true;
          //   });
          //   // Get.to(() => Applyleave());
          // }
        },
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        backgroundColor: Colors.white,
      ),
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   icons: iconList,
      //   activeIndex: _bottomNavIndex,
      //   leftCornerRadius: 32,
      //   rightCornerRadius: 32,
      //   onTap: (index) => setState(() => _bottomNavIndex = index),
      //   //other params
      // ),
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
