import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DialogBuilder {
  DialogBuilder();

  final BuildContext? context = Get.context;
  static bool isDisplaying = false;

  static void showLoadingIndicator({bool onWillPop = true}) {
    if (isDisplaying) {
      return;
    } else {
      isDisplaying = true;

      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              backgroundColor: Colors.white,
              content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _getLoadingIndicator(),
                    _getHeading(context),
                  ]),
            ),
            onWillPop: () async {
              if (onWillPop) {
                isDisplaying = false;
              }
              return onWillPop;
            },
          );
        },
      );
    }
  }

  static void hideOpenDialog() {
    if (isDisplaying) {
      isDisplaying = false;
      Get.back();
    }
  }

  static Padding _getLoadingIndicator() {
    return const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child:
            // Image.asset(
            //   "assets/loading.gif",
            //   height: 50.0,
            //   width: 50.0,
            // ),
            SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(strokeWidth: 3)));
  }

  static Widget _getHeading(context) {
    return const Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: Text(
          'Please wait …',
          style: TextStyle(color: Colors.black, fontSize: 16),
          textAlign: TextAlign.center,
        ));
  }
}
