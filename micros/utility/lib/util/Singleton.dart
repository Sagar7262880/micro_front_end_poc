import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Singleton {
  static isOnline() async {
    bool isConnect = false;
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult[0] == ConnectivityResult.mobile) {
      isConnect = true;
    } else if (connectivityResult[0] == ConnectivityResult.wifi) {
      isConnect = true;
    } else if (connectivityResult[0] == ConnectivityResult.ethernet) {
      isConnect = true;
    } else if (connectivityResult[0] == ConnectivityResult.none) {
      isConnect = false;
    }
    return isConnect;
  }

  static showImageDialog(
    String title,
    String msg,
    String strImagePath, {
    VoidCallback? onClickOK,
  }) {
    onClickOK ??= () => Get.back();
    Get.defaultDialog(
      title: '',
      contentPadding: EdgeInsets.zero,
      barrierDismissible: false,
      // User must tap the button!
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Image.asset(strImagePath, height: 100, width: 200),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              msg,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 30,
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: ElevatedButton(
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: onClickOK,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
