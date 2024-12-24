import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xF5F7FA),
      backgroundColor: hexToColor("#F5F7FA"),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Container(
            width: double.infinity,
            height: 600,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: hexToColor("#0052CC").withOpacity(0.1),
                      blurRadius: 30.0,
                      spreadRadius: 2),
                ],
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ]),
    );
  }
}
