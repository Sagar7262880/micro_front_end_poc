// ignore_for_file: depend_on_referenced_packages

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:micro_front_end_poc/screens/home.dart';
import 'package:leave/apply/view/ApplyLeave.dart';
import 'package:geo_fencing/fencing/BackgroundGeoServiceView.dart';
import 'package:utility/utility.dart';

import '../Constant/constant_color.dart';
import '../Controller/theme_controller.dart';

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
    const MyHomePage(title: "Infogird POC"),
    const SearchPage(),
    const Applyleave(),
    const Backgroundgeoserviceview(),
    ProfilePage(),
  ];

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
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
            isActive ? Theme
                .of(context)
                .dividerColor : Colors.grey;
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
          gapLocation: GapLocation.none,
          // Remove the center gap for floating action button
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          height: height / 9.99 - 10,
          backgroundColor: themeController.currentColor.value == "dr"
              ? Colors.black26
              : Colors.white,
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
            Obx(() =>
                Text(
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
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium),
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
            /* Obx(() =>  */ ElevatedButton(
              /*style: themeController.isDarkMode.value != "d" ||
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
                    ),*/
              onPressed: () {
                debugPrint('Button!');
              },
              child: Text(
                'Submit'.toUpperCase(),
                style: themeController.isDarkMode.value != "d" ||
                    themeController.isDarkMode.value != "l"
                    ? null
                    : TextStyle(
                  color: themeController.isDarkMode.value == "d"
                      ? Theme
                      .of(context)
                      .colorScheme
                      .onPrimary
                      : Theme
                      .of(context)
                      .colorScheme
                      .onSecondary,
                ),
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              child: Text("Visit GeeksforGeeks"),
              onPressed: () async {},
            ),
            const SizedBox(height: 5),
            OutlinedButton(
              child: Text('Outlined Button'),
              onPressed: (){},
            ),
            const SizedBox(height: 5),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_up)),
            SizedBox(height: 5),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
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
