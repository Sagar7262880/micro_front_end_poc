import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:utility/utility.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/placeholder.jpg"),
          ),
        ),
        title: Text(
          "Dashboard",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.qr_code_scanner_outlined,
              size: 25,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Good Morning Widget

          CustomContainerWidget(
            child: Row(
              children: [
                const CustomCircularImage(
                  imagePath: 'assets/coffee-break.gif',
                  size: 70.0, // You can adjust the size as needed
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Good Morning,",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 24),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Abhijit",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          )
                        ],
                      ),
                      Text("13 Firday, 2023")
                    ],
                  ),
                )
              ],
            ),
          ),

          // Check in Check Out Widget
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Row(
              children: [
                CustomSignInSignOutWidget(
                  checkTime: "09:00 AM",
                  isCheckIn: true,
                ),
                SizedBox(
                  width: 2,
                ),
                CustomSignInSignOutWidget(
                    checkTime: "06:00 PM", isCheckIn: false),
              ],
            ),
          ),

          // Pia Chart Widget
          CustomContainerWidget(
            paddingTop: 5,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dashboard",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const CustomPieChartWidget(
                  pieData: [30, 20, 25, 15, 10], // Data for the pie chart
                  indicators: [
                    'Weekly Off',
                    'Present',
                    'Absent',
                    'Leave',
                    'Holiday'
                  ], // Corresponding labels
                  colors: [
                    Colors.purple,
                    Colors.green,
                    Colors.red,
                    Colors.blue,
                    Colors.orange,
                  ], // Colors for each section
                ),
              ],
            ),
          ),

          // My Leave Summary
          CustomContainerWidget(
            paddingTop: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Leave Summary",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10, // Adjust this count as needed
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 10),
                        child: CustomProgressCard(
                          currentValue: 5,
                          maxValue: 10,
                          label: 'Task Progress',
                          progress: 0.5,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Event List

          CustomContainerWidget(
            paddingTop: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Event List",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              CustomCircularImage(
                                imagePath: 'assets/placeholder.jpg',
                                size: 40.0, // You can adjust the size as needed
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ganesh Patil",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    Text("01 Dec,Birthday")
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.2),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.cake_outlined),
                                  )),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          //color: hexToColor("#F5F7FA"),
                          height: 0,
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),

          // Birthday and anniversary

          CustomContainerWidget(
            paddingTop: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Birthday & Anniversary",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 130,
                  // Increased height to accommodate the adjusted position
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10, // Replace with your dynamic list count
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              // Allow elements to overflow
                              children: [
                                CustomCircularImage(
                                  imagePath: 'assets/placeholder.jpg',
                                  size: 70.0, // You can adjust the size as needed
                                ),
                                Positioned(
                                  bottom: -10,
                                  // Moved slightly below the bottom of the image
                                  left: 0,
                                  right: 0,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.8),
                                        // Darker for contrast
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        // Adjusted padding
                                        child: Text(
                                          "01 Dec",
                                          // Replace with dynamic date
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            // Increased spacing for better alignment
                            Text(
                              "Name $index",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              "Birthday",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Today's Birthday

          CustomContainerWidget(
            paddingTop: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  "Today's Birthday",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10),

                // Carousel Slider
                CustomCarouselSlider(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index, int pageViewIndex) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.pink, Colors.deepPurple],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Profile Picture
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const CustomCircularImage(
                                  imagePath: 'assets/placeholder.jpg',
                                  size: 70.0,
                                ),
                              ),
                              const SizedBox(width: 15),
                              // Name and Birthday
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Ganesh Patil",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    "01 Dec, Birthday",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              // Icon
                              CustomCircularImage(
                                imagePath: 'assets/birthday.gif',
                                size: 70.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

}
