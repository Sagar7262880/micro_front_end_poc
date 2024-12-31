import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }

  int touchedIndex = -1;

  List<double> pieData = [40, 30, 15, 15, 10, 20];

  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexToColor("#F5F7FA"),
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

          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: Row(
                children: [
                  Image.asset(
                    "assets/placeholder.jpg",
                    width: 50,
                    height: 50,
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
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
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
          ),

          // Check in Check Out Widget
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Row(
              children: [
                checkWidget(checkTime: "09:00 AM", isCheckIn: true),
                SizedBox(
                  width: 2,
                ),
                checkWidget(checkTime: "06:00 PM", isCheckIn: false),
              ],
            ),
          ),

          // Pia Chart Widget
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Card(
              child: Container(
                width: double.infinity,

                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dashboard",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Column(
                        children: [
                          Column(
                            children: List.generate(1, (index) {
                              return TweenAnimationBuilder<double>(
                                tween: Tween<double>(
                                  begin: 0.0,
                                  end: pieData[index],
                                ),
                                duration: const Duration(seconds: 1),
                                builder: (context, animatedValue, child) {
                                  return AspectRatio(
                                    aspectRatio: 1.5,
                                    child: PieChart(
                                      PieChartData(
                                        pieTouchData: PieTouchData(
                                          touchCallback: (FlTouchEvent event,
                                              pieTouchResponse) {
                                            setState(() {
                                              if (!event
                                                      .isInterestedForInteractions ||
                                                  pieTouchResponse == null ||
                                                  pieTouchResponse
                                                          .touchedSection ==
                                                      null) {
                                                touchedIndex = -1;
                                                return;
                                              }
                                              touchedIndex = pieTouchResponse
                                                  .touchedSection!
                                                  .touchedSectionIndex;
                                            });
                                          },
                                        ),
                                        borderData: FlBorderData(show: false),
                                        sectionsSpace: 4,
                                        centerSpaceRadius: 90,
                                        sections:
                                            List.generate(pieData.length, (i) {
                                          final isTouched = i == touchedIndex;
                                          final fontSize =
                                              isTouched ? 25.0 : 16.0;
                                          final radius = isTouched ? 60.0 : 30.0;
                                          const shadows = [
                                            Shadow(
                                                color: Colors.black,
                                                blurRadius: 2)
                                          ];
                                          return PieChartSectionData(
                                            color: getColor(i),
                                            value: i == index
                                                ? animatedValue
                                                : pieData[i],
                                            title:
                                                '${(i == index ? animatedValue : pieData[i]).toStringAsFixed(0)}%',
                                            radius: radius,
                                            titleStyle: TextStyle(
                                              fontSize: fontSize,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              shadows: shadows,
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 16,
                            runSpacing: 8,
                            children: [
                              buildIndicator(
                                  color: Colors.purple, text: 'Weekly Off'),
                              buildIndicator(
                                  color: Colors.green, text: 'Present'),
                              buildIndicator(color: Colors.red, text: 'Absent'),
                              buildIndicator(color: Colors.blue, text: 'Leave'),
                              buildIndicator(
                                  color: Colors.orange, text: 'Holiday'),
                              buildIndicator(
                                  color: Colors.yellow, text: 'Miss Punch'),
                              buildIndicator(
                                  color: Colors.teal, text: 'Out Duty'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // My Leave Summary
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
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
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '3',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            Text(
                                              '/6',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            ),
                                          ],
                                        ),
                                        Text('Casual \n Leave',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 40.0, right: 20),
                                      child: CircularProgressIndicator(
                                        backgroundColor:
                                            Colors.purple.withOpacity(0.2),
                                        color: Theme.of(context).primaryColor,
                                        strokeWidth: 7,
                                        value: 0.5,
                                        strokeAlign: 2,

                                        // Set this value dynamically based on leave progress
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Event List

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      'assets/placeholder.jpg',
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                              color: hexToColor("#F5F7FA"),
                              height: 0,
                            )
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Birthday and anniversary

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Birthday & Anniversary",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
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
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        'assets/placeholder.jpg',
                                        // Replace with dynamic image path
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.cover,
                                      ),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
            ),
          ),

          // Today's Birthday

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
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
                    CarouselSlider.builder(
                      itemCount: 15, // Replace with your actual item count
                      options: CarouselOptions(
                        height: 140,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0, // Ensures only one banner is visible
                        onPageChanged: (index, reason) {
                          // Update the dot indicators
                          setState(() {
                            _current = index; // Assuming _current is declared in your class
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.pink, Colors.deepPurple],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.purple.withOpacity(0.3),
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                        'assets/placeholder.jpg',
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      ),
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
                                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "01 Dec, Birthday",
                                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),

                                  // Icon
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.cake_outlined,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),

                    // Dots Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(15, (index) { // Ensure itemCount matches here
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(index), // Assuming _controller is initialized
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                                  .withOpacity(_current == index ? 0.4 : 0.2),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          )



          ]),
      ),
    );
  }

  Widget checkWidget({required bool isCheckIn, required String checkTime}) {
    return Expanded(
      child: Container(
        height: 100,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                Icons.login_outlined,
                color: isCheckIn ? Colors.green : Colors.red,
              ),
              decoration: BoxDecoration(
                  color: isCheckIn
                      ? Colors.green.withOpacity(0.2)
                      : Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15)),
              height: 50,
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isCheckIn ? "Check In" : "Check Out"),
                  Text(
                    checkTime,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(int index) {
    switch (index) {
      case 0:
        return Colors.blueAccent;
      case 1:
        return Colors.red;
      case 2:
        return Colors.purple;
      case 3:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Widget buildIndicator({required Color color, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
