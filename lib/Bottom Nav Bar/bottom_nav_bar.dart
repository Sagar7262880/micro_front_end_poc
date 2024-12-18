// ignore_for_file: depend_on_referenced_packages

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:micro_front_end_poc/screens/dashboard.dart';
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
  int _currentIndex = 0;


  // List of pages for navigation
  final List<Widget> pages = [
    const Dashboard(),
    // const MyHomePage(title: "Infogird POC"),
    const SearchPage(),
    const Applyleave(),
    const Backgroundgeoserviceview(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        // selectedLabelStyle: const TextStyle(
        //   fontWeight: FontWeight.bold,
        //   color: Colors.red, // Black text for selected label
        // ),
        // unselectedLabelStyle: const TextStyle(
        //   fontWeight: FontWeight.normal,
        //   color: Colors.red, // Default color for unselected label
        // ),
        showUnselectedLabels: true,
        mouseCursor: SystemMouseCursors.none,


        items: List.generate(5, (index) {
          final bool isSelected = _currentIndex == index;
          return BottomNavigationBarItem(
            icon: isSelected
                ? Container(
              width: 60,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
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
    );
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
}


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
