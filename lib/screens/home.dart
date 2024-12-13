import 'package:flutter/material.dart';
import 'package:utility/utility.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var obj = SharedService();
  var dio = DioService();
  var controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final simpleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        scrollBehavior: ScrollBehavior(),
        slivers: [
          // SliverAppBar for a collapsible header
          // SliverAppBar(
          //   pinned: false, // Keeps the app bar visible when scrolled
          //   floating: true,
          //   expandedHeight: 50.0,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Text(
          //       widget.title,
          //       style: const TextStyle(color: Colors.black),
          //     ),
          //     // background: Container(
          //     //   color: Theme.of(context)
          //     //       .primaryColor, // Match the background color
          //     // ),
          //     collapseMode: CollapseMode.none,
          //   ),
          // ),

          // SliverPadding for consistent padding around the content
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/applyLeave");
                        },
                        child: buildCard(
                          title: "Apply Leave",
                          imagePath: "assets/house.png",
                        ),
                      ),
                    ),
                    const SizedBox(width: 10), // Add spacing between cards
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/applyOutDuty");
                        },
                        child: buildCard(
                          title: "Apply Out Duty",
                          imagePath: "assets/calendar.png",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/applyLeave");
                        },
                        child: buildCard(
                          title: "Reports",
                          imagePath: "assets/report.png",
                        ),
                      ),
                    ),
                    const SizedBox(width: 10), // Add spacing between cards
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/applyOutDuty");
                        },
                        child: buildCard(
                          title: "Profile",
                          imagePath: "assets/working.png",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showSuccessBottomSheet(
                          context,
                          "Successfully",
                          "Great It's working..!",
                        );
                      },
                      child: const Text("Apply"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        showErrorBottomSheet(
                          context,
                          "Oopsss...!",
                          "Please enter date..!",
                        );
                      },
                      child: const Text("Error"),
                    ),
                    const SizedBox(width: 10), //

                    ElevatedButton(
                      onPressed: () async {
                        var b =
                            await obj.setString("username", "Sagar Salunke");

                        print(b);
                        var res = await dio
                            .get("https://jsonplaceholder.typicode.com/posts");
                        log(res.toString());
                      },
                      child: const Text("Shared"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                const SizedBox(
                  height: 100,
                ),
                const SizedBox(
                  height: 100,
                ),
                DynamicDropDown(
                  // context: context,
                  controller: controller,
                  labelText: "Select Item",
                  isSearchable: false,
                  onChanged: (value) {
                    print("Input changed: $value");
                  },
                  onSuggestionCallBack: (pattern) async {
                    return Future.delayed(Duration(milliseconds: 500), () {
                      return [
                        'Apple',
                        'Banana',
                        'Cherry',
                        'Date',
                        'Elderberry',
                        'Fig',
                        'Grape',
                        'Honeydew',
                        'Indian Fig',
                        'Jackfruit',
                        'Kiwi',
                        'Lemon',
                        'Mango',
                        'Nectarine',
                        'Orange',
                        'Papaya',
                        'Quince',
                        'Raspberry',
                        'Strawberry',
                        'Tangerine',
                        'Ugli Fruit',
                        'Vanilla Bean',
                        'Watermelon',
                        'Xigua',
                        'Yellow Passion Fruit'
                      ]
                          .where((item) => item
                              .toLowerCase()
                              .contains(pattern.toLowerCase()))
                          .toList();
                    });
                  },
                  // isSearchable: true,
                  onSuggestionSelected: (value) {
                    controller.text = value;
                    print("Selected: $value");
                  },
                  suggestionBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion),
                    );
                  },
                ),
                TextFormField(),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => Test());
                    },
                    child: Text("Test"))
              ]),
              delegate: SliverChildListDelegate(
                [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed("/applyLeave");
                          },
                          child: buildCard(
                            title: "Apply Leave",
                            imagePath: "assets/house.png",
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Add spacing between cards
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed("/applyOutDuty");
                          },
                          child: buildCard(
                            title: "Apply Out Duty",
                            imagePath: "assets/calendar.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed("/applyLeave");
                          },
                          child: buildCard(
                            title: "Reports",
                            imagePath: "assets/report.png",
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // Add spacing between cards
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.toNamed("/applyOutDuty");
                          },
                          child: buildCard(
                            title: "Profile",
                            imagePath: "assets/working.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showSuccessBottomSheet(
                            context,
                            "Yippee...!",
                            "Leave Applied Successfully.",
                          );
                        },
                        child: const Text("Apply"),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () async {
                          // Show error bottom sheet
                          showErrorBottomSheet(
                            context,
                            "Oopsss...!",
                            "Please enter date..!",
                          );

                          // Check if the device can vibrate
                          final canVibrate = await Haptics.canVibrate();

                          // Show snackbar message based on vibration capability
                          if (!context.mounted) return;
                          final snackbarMessage = canVibrate
                              ? 'Haptic feedback enabled!'
                              : 'This device does not support haptic feedback.';
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(snackbarMessage,
                                  textAlign: TextAlign.center),
                              duration: const Duration(seconds: 1),
                            ),
                          );

                          // Trigger haptic feedback if the device supports it
                          if (canVibrate) {
                            await Haptics.vibrate(HapticsType.warning);
                          }
                        },
                        child: const Text("Error"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: 'Hello',
                            cancel: Text(
                              'Cancel',
                            ),
                            onCancel: () {
                              Get.offNamed('/');
                            },
                          );
                        },
                        child: Text(
                          'Dialog Box',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                      isDisabled: false,
                      controller: simpleController,
                      labelText: 'Name',
                      hintText: 'Ashutosh',
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.person_2_outlined)
                      // suffixIcon: const Icon(Icons.arrow_drop_down),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build a card
  Widget buildCard({required String title, required String imagePath}) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 120, // Fixed height for all cards
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imagePath,
                width: 50,
                height: 50, // Fixed size for images
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16), // Consistent font size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
