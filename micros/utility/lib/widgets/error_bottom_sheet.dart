import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showErrorBottomSheet(BuildContext context, successMessage, description) {
  // String successMessage = '';
  // String description = '';
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    enableDrag: false,
    builder: (context) {
      return Container(
        width: double.infinity,
        height: 600,
        padding: const EdgeInsets.all(16.0),
        /*decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.0),
          ),
        ),*/
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset(
              "assets/error.json",
              width: width * 1,
              height: height * 0.3,
            ),
            Text(
              successMessage,
              /*style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),*/
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              /*style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),*/
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: width * 0.4,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: const Text('OK'),
              ),
            ),
          ],
        ),
      );
    },
  );
}
