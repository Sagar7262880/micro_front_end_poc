import 'package:flutter/material.dart';
import 'package:utility/utility.dart';


class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ThemeController themeController = Get.find();
  var selectedValue = 1.obs;
  bool _isChecked = false;
  final RadioController controller = Get.put(RadioController());

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
            Text('Select an Option:'),
            SizedBox(height: 20),
            Obx(() {
              return Column(
                children: [
                  RadioListTile<int>(
                    value: 1,
                    groupValue: controller.selectedValue.value,
                    onChanged: (int? newValue) {
                      controller.selectedValue.value =
                          newValue!; // Update the value
                    },
                    title: Text('Option 1',
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                  RadioListTile<int>(
                    value: 2,
                    groupValue: controller.selectedValue.value,
                    onChanged: (int? newValue) {
                      controller.selectedValue.value =
                          newValue!; // Update the value
                    },
                    title: Text('Option 2'),
                  ),
                ],
              );
            }),
            const SizedBox(height: 10),
            Obx(() => CheckboxListTile(
                  title: Text("Accept Terms and Conditions"),
                  value: controller.isChecked.value,
                  onChanged: (bool? newValue) {
                    controller.toggleCheckbox();
                  },
                )),
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

class RadioController extends GetxController {
  var selectedValue = 1.obs; // The value starts as 1, and it's an observable
  var isChecked = false.obs;

  // Method to toggle the checkbox
  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }
}
