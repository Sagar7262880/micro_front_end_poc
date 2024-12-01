import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Applyleave extends StatefulWidget {
  const Applyleave({super.key});

  @override
  State<Applyleave> createState() => _ApplyleaveState();
}

class _ApplyleaveState extends State<Applyleave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(child: Text("Apply Leave"),),
    );
  }
}
