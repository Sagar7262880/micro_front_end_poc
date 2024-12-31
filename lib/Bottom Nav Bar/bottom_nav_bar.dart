// ignore_for_file: depend_on_referenced_packages

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:micro_front_end_poc/screens/dashboard.dart';

import 'package:leave/apply/view/ApplyLeave.dart';
import 'package:geo_fencing/fencing/BackgroundGeoServiceView.dart';
import 'package:micro_front_end_poc/screens/socket_example.dart';
import 'package:utility/utility.dart';

import '../Constant/constant_color.dart';
import '../Controller/theme_controller.dart';
import '../screens/calculator.dart';

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
    HugeIcons.strokeRoundedDashboardSquare01,
    // Icon for the Apply Leave functionality
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
    // const MyHomePage(title: "Infogird POC"),
    const Dashboard(),
    //StockMarketPage(),
    MyHomePage(
      title: "This is my flutter projects",
    ),
    const Applyleave(),
    const Backgroundgeoserviceview(),
    ProfilePage(),
  ];

  final ThemeController themeController = Get.find();

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
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: _bottomNavIndex,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index; // Update the selected index
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          showUnselectedLabels: true,
          mouseCursor: SystemMouseCursors.none,
          items: List.generate(5, (index) {
            final bool isSelected = _bottomNavIndex == index;
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
        ), /*AnimatedBottomNavigationBar.builder(
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
          backgroundColor: themeController.currentColor.value=="dr"?Colors.black26: Colors.white,
        ),*/
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
  ProfilePage({super.key});

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        actions: [
          IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                debugPrint(themeController.isDarkMode.toString());
                if (themeController.currentColor.value != "lt") {
                  themeController.toggleTheme("lt"); // Set to light mode
                } else {
                  themeController.toggleTheme("dr"); // Set to dark mode
                }
              }),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Obx(() => Text(
                  themeController.currentColor.value == "dr"
                      ? 'Dark Mode is ON'
                      : 'Light Mode is ON',
                  style: const TextStyle(fontSize: 24),
                )),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text("Change Theme")),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Choose any one of following color theme",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // Red theme option
                          ColorOptionButton(
                            color: red,
                            isSelected:
                                themeController.currentColor.value == 'r',
                            onTap: () {
                              themeController.toggleTheme("r");
                            },
                          ),
                          // Blue theme option
                          ColorOptionButton(
                            color: blue,
                            isSelected:
                                themeController.currentColor.value == 'b',
                            onTap: () {
                              themeController.toggleTheme("b");
                            },
                          ),
                          // Orange theme option
                          ColorOptionButton(
                            color: orange,
                            isSelected:
                                themeController.currentColor.value == 'o',
                            onTap: () {
                              themeController.toggleTheme("o");
                            },
                          ),
                          // Green theme option
                          ColorOptionButton(
                            color: green,
                            isSelected:
                                themeController.currentColor.value == 'g',
                            onTap: () {
                              themeController.toggleTheme("g");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Icon(Icons.ac_unit),
            const SizedBox(height: 10),
            /* Obx(() =>  */ ElevatedButton(
              style: themeController.isDarkMode.value != "d" ||
                      themeController.isDarkMode.value != "l"
                  ? null
                  : ElevatedButton.styleFrom(
                      backgroundColor: themeController.isDarkMode.value == "d"
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                      foregroundColor: themeController.isDarkMode.value == "d"
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSecondary,
                      elevation:
                          themeController.isDarkMode.value == "d" ? 5 : 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
              onPressed: () {
                debugPrint('Button Pressed!');
              },
              child: Text(
                'Submit'.toUpperCase(),
                style: themeController.isDarkMode.value != "d" ||
                        themeController.isDarkMode.value != "l"
                    ? null
                    : TextStyle(
                        color: themeController.isDarkMode.value == "d"
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
              ),
            ),
            const SizedBox(height: 5),
            Obx(() => TextField(
                style: TextStyle(
                  color: themeController.isDarkMode.value == "d"
                      ? white
                      : black, // Text color
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: themeController.isDarkMode.value == "d"
                      ? white // Dark mode background color for text field
                      : white,
                  // Light mode background color for text field
                  hintText: 'Enter text',
                  hintStyle: TextStyle(
                    color: themeController.isDarkMode.value == "d"
                        ? grey[400]
                        : grey[700], // Hint text color
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: themeController.isDarkMode.value == "d"
                          ? white.withOpacity(0.6) // Dark mode border color
                          : black.withOpacity(0.6),
                      // Light mode border color
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: themeController.isDarkMode.value == "d"
                          ? white.withOpacity(0.6)
                          : black.withOpacity(0.6),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: themeController.isDarkMode.value == "d"
                          ? white
                          : blue,
                      width: 2.0,
                    ),
                  ),
                ))),
          ],
        ),
      ),
    );
  }
}

class ColorOptionButton extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorOptionButton({
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 40,
        height: 40,
        child: Card(
          shape: const CircleBorder(),
          color: color,
          elevation: 15,
          child: isSelected
              ? const Icon(Icons.check, size: 30.0, color: white)
              : const Icon(Icons.arrow_drop_down,
                  color: transparent, size: 30.0),
        ),
      ),
    );
  }
}
