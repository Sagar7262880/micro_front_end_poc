import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utility/utility.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var obj = SharedService();
  var dio = DioService();
  var controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final simpleController = TextEditingController();
  final dateCtr = TextEditingController();
  final timeCtr = TextEditingController();
  final monthCtr = TextEditingController();
  final nameCtr = TextEditingController();
  final passCtr = TextEditingController();
  final sdCtr = TextEditingController();
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        scrollBehavior: const ScrollBehavior(),
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
          Form(
            key: globalKey,
            child: SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
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
                        var s = SharedService();
                        print(s.getString("isDark"));
                        Get.toNamed("/themeseting");
                      },
                      child: const Text("Theme Setting"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () async {
                    var b = await PermissionHandler.requestLocationPermission();
                    print("======== $b");
                  },
                  child: const Text("Get Location Permission"),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomCardView(
                    leading: CircleAvatar(
                      child: Icon(Icons.person,
                          color: Theme.of(context).primaryColor),
                    ),
                    title: const Text("John Doe"),
                    subtitle: const Text("Tap to view profile"),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: Theme.of(context).primaryColor),
                    onTap: () {
                      print("Profile tapped!");
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const CustomCardView(
                  leading: Icon(Icons.info),
                  title: Text("Information"),
                  subtitle: Text("This card shows an info message."),
                  // backgroundColor: Colors.blue[50],
                  trailing: Icon(Icons.more_vert),
                ),
                const SizedBox(height: 16),
                const CustomCardView(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  subtitle: Text("Manage your app settings."),
                  trailing: Switch(value: true, onChanged: null),
                  elevation: 6.0,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                const CustomExpansionTile(
                  title: Row(
                    children: [
                      Icon(Icons.folder),
                      SizedBox(width: 8),
                      Text("Section 1",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  subtitle: Text("Tap to expand"),
                  leading: Icon(Icons.info),
                  // backgroundColor: Colors.grey[200],
                  // expandedBackgroundColor: Colors.grey[300],
                  childrenPadding: EdgeInsets.all(16.0),
                  children: [
                    ListTile(title: Text("Item 1")),
                    ListTile(title: Text("Item 2")),
                  ],
                ),
                const CustomExpansionTile(
                  title: Text(
                    "Section 2",
                  ),
                  leading: Icon(
                    Icons.settings,
                  ),
                  children: [
                    ListTile(title: Text("Setting 1")),
                    ListTile(title: Text("Setting 2")),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    var b = await PermissionHandler.requestCameraPermission();
                    print("======== " + b.toString());
                  },
                  child: const Text("Get camera Permission"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var b = await PermissionHandler.requestContactsPermission();
                    print("======== " + b.toString());
                  },
                  child: const Text("Get contact Permission"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var b = await PermissionHandler.requestStoragePermission();
                    print("======== " + b.toString());
                  },
                  child: const Text("Get storage Permission"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var b =
                        await PermissionHandler.requestMicrophonePermission();
                    print("======== " + b.toString());
                  },
                  child: const Text("Get microphone Permission"),
                ),
                // const SizedBox(
                //   height: 100,
                // ),
                DynamicDropDown(
                  // context: context,
                  controller: controller,
                  isSearchable: true,
                  labelText: "Select Item",
                  onChanged: (value) {
                    print("Input changed: $value");
                  },
                  onSuggestionCallBack: (pattern) async {
                    return Future.delayed(const Duration(milliseconds: 500),
                        () {
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
                    if (kDebugMode) {
                      print("Selected: $value");
                    }
                  },
                  suggestionBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion),
                    );
                  },
                ),
                DatePickerField(
                  controller: dateCtr,
                  label: "Select Date",
                  // isEnabled: false,
                  // validatorText: "kar na bho date select",
                ),
                TimePickerField(
                  controller: timeCtr,
                  label: "Select Time",
                  isValidate: true,
                ),
                MonthPickerField(
                  controller: monthCtr,
                  label: "Select Month",
                  isValidate: true,
                ),
                TxtField(label: "Full Name", controller: nameCtr),
                TxtField(
                  label: "Attachment",
                  controller: nameCtr,
                  isReadOnly: true,
                  onTap: () async {
                    await ImagePicker.pickImage(
                      isFromFile: true,
                      isOnlyImage: false,
                      isMultipleFile: false,
                      isImgCropeble: true,
                    );
                  },
                ),
                TxtPassword(
                  label: "Password",
                  controller: passCtr,
                ),
                SimpleDropdown(
                  labelText: "Select ",
                  onChanged: (value) {},
                  items: const [
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
                  ],
                ),
                // TextFormField(),
                ElevatedButton(
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        print("trueeee");
                        var d = DateTime.parse(dateCtr.text);
                        print(d.toString());
                      } else {
                        print("false");
                      }
                    },
                    child: const Text("Submit"))
              ])),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build a card
  Widget buildCard({required String title, required String imagePath}) {
    return Card(
      //color: Colors.white,
      /*shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),*/
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
