import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:micro_front_end_poc/screens/home.dart';

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
    HugeIcons.strokeRoundedDashboardSquare01,
    HugeIcons.strokeRoundedUserStatus,
    HugeIcons.strokeRoundedSearchList01,
  ];

  // List of navigation labels
  final List<String> labels = ["Home", "Menu", "Favorites", "Profile"];

  // List of pages for navigation
  final List<Widget> pages = [
    const MyHomePage(title: "Infogird POC"),
    const SearchPage(),
    const FavoritesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_bottomNavIndex], // Display the selected page
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Perform action based on the selected tab
          if (_bottomNavIndex == 0) {
            // Action for "Home"
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Home FAB Action")),
            );
          } else if (_bottomNavIndex == 1) {
            // Action for "Search"
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Menu")),
            );
          } else if (_bottomNavIndex == 2) {
            // Action for "Favorites"
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Favorites FAB Action")),
            );
          } else if (_bottomNavIndex == 3) {
            // Action for "Profile"
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Profile FAB Action")),
            );
          }
        },
        child: const Icon(Icons.add),
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
        onTap: (index) => setState(() => _bottomNavIndex = index),
        // activeColor: Colors.blue,
        // inactiveColor: Colors.black54,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        backgroundColor: Colors.white,
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
