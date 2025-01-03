import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketExample extends StatefulWidget {
  const SocketExample({super.key});

  @override
  State<SocketExample> createState() => _SocketExampleState();
}

class _SocketExampleState extends State<SocketExample> {

  late IO.Socket socket;

  @override
  void initState() {

  }

  // void connectToWs() async {
  //   try {
  //    // spData = await SharedPreferences.getInstance();
  //     socket = IO.io("https://api.infogird.com/", <String, dynamic>{
  //       'autoConnect': true,
  //       'transports': ['websocket'],
  //       'path': '/prod/api/web-socket'
  //     });
  //
  //    // final domain = spData.getString("domainName") ?? "";
  //
  //     socket.onConnectError(
  //           (data) => print("===== on connect error ${data}"),
  //     );
  //  //   final deviceId = await getDeviceId();
  //     socket.onConnect((_) {
  //       print(" WEB SOCKET CONNECTED");
  //       socket.emit('join', {'host': "demo", 'roomName': userId});
  //     });
  //     socket.onDisconnect((r) => print("CONNECTION DISCONNECTED"));
  //     socket.onclose(
  //             (reson) => print("=========== web socket connection closed $reson"));
  //     socket.on('event', (data) => print(data));
  //     socket.on('KIOSK_USER_PUNCH', (data) => autoLogin(data));
  //     socket.onError(
  //           (data) {
  //         print("====== on error ${data}");
  //       },
  //     );
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
  //
  // void autoLogin(data) async {
  //   DialogBuilder(context).showLoadingIndicator(true);
  //   print("============data: " + data.toString());
  //  // final spData = await SharedPreferences.getInstance();
  //   if (data["status"]) {
  //     debugPrint('employee code is ${data["data"]["emp_code"]}');
  //     print(data["data"]);
  //     if (data["data"].toString().contains("userType")) {
  //       spData.setString('userType', data["data"]["userType"].toString());
  //     } else {
  //       spData.setString('userType', "EMPLOYEE");
  //     }
  //     spData.setBool('login', true);
  //     spData.setString('accessToken', data["accessToken"] ?? "");
  //     spData.setString('refreshToken', data["refreshToken"] ?? '');
  //     spData.setString('userId', data["data"]["user"] ?? '');
  //     spData.setString("assetsPath", data["data"]["assets"] ?? '');
  //     spData.setString("domainimg", domainImgUrl);
  //     spData.setString("profilePath", data["data"]["profilePicture"] ?? "");
  //     spData.setString("ismockshow", "0");
  //     spData.setString('emp_code', data["data"]["emp_code"] ?? '');
  //     spData.setString('usernames', data["data"]["name"] ?? '');
  //
  //     await DioService().initializeDio();
  //
  //     socket.disconnect();
  //     socket.close();
  //
  //     DialogBuilder(context).hideOpenDialog();
  //     Get.off(() => Dashboard());
  //     // Navigator.pushReplacement(
  //     //     context, MaterialPageRoute(builder: (context) => const Dashboard()));
  //   } else {
  //     DialogBuilder(context).hideOpenDialog();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stock Market Real-Time Updates')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // child: Column(
        //   children: [
        //     // Use StreamBuilder to listen for updates
        //     StreamBuilder<Map<String, dynamic>>(
        //       stream: _socketService.dataStream,
        //       builder: (context, snapshot) {
        //         if (snapshot.connectionState == ConnectionState.waiting) {
        //           return Center(child: CircularProgressIndicator());
        //         }
        //
        //         if (snapshot.hasError) {
        //           return Center(child: Text('Error: ${snapshot.error}'));
        //         }
        //
        //         if (!snapshot.hasData) {
        //           return Center(child: Text('Waiting for stock updates...'));
        //         }
        //
        //         // Access the stock data (e.g., price and symbol)
        //         final stockData = snapshot.data!;
        //         final stockSymbol = stockData['symbol'] ?? 'Unknown';
        //         final stockPrice = stockData['price'] ?? 0.0;
        //
        //         return Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text('Stock Symbol: $stockSymbol', style: TextStyle(fontSize: 24)),
        //             Text('Current Price: \$${stockPrice.toStringAsFixed(2)}', style: TextStyle(fontSize: 24)),
        //           ],
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ),
    );
  }
}