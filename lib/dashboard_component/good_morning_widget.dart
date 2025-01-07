import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart'; // For formatting the date
import 'package:utility/utility.dart';

class GoodMorningWidget extends StatelessWidget {
  final String userName;
  final String? date;
  final bool? showShimmer;
  final bool showWidget;

  const GoodMorningWidget({
    super.key,
    required this.userName,
    this.date,
    this.showShimmer = false,
    required this.showWidget
  });

  String getFormattedDate() {
    final now = DateTime.now();
    return DateFormat('d EEEE, yyyy').format(now); // Format: 13 Friday, 2023
  }

  @override
  Widget build(BuildContext context) {
    final displayDate = date ?? getFormattedDate(); // Use provided date or default to current

    return showWidget == true? showShimmer == true
        ? CustomContainerWidget(
      child: Row(
        children: [
          const CustomCircularImage(
            imagePath: 'assets/coffee-break.gif',
            size: 70.0,
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
                        fontSize: 24,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        userName,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
                Text(displayDate),
              ],
            ),
          ),
        ],
      ),
    )
        : Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            const CustomCircularImage(
              imagePath: 'assets/coffee-break.gif',
              size: 70.0,
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
                          fontSize: 24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          userName,
                          style:
                          Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),
                  Text(displayDate),
                ],
              ),
            ),
          ],
        ),
      ),
    ):Container();
  }
}
