import 'package:flutter/material.dart';
import 'package:utility/utility.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      //scrolledUnderElevation: 0,
      title: RawScrollbar(
        thumbColor: Colors.redAccent,
        radius: Radius.circular(20),
        thickness: 5,
        child: Row(
          children: [
            const CustomCircularImage(
              imagePath: "assets/placeholder.jpg",
              size: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  // Your QR Code scanner logic
                },
                borderRadius: BorderRadius.circular(20),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  child: Icon(
                    Icons.qr_code_scanner_outlined,
                    size: 24,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Your notifications logic
                },
                borderRadius: BorderRadius.circular(50),
                child:  Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child:Icon(
                    Icons.add_alert_outlined,
                    size: 24,
                  )
                ),
              ),
              InkWell(
                onTap: () {
                  // Your notifications logic
                },
                borderRadius: BorderRadius.circular(50),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Icon(
                    Icons.more_vert_outlined,
                    size: 24,
                  ),

                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0); // Standard AppBar height
}
