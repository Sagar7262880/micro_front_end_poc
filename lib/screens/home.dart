import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utility/utility.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed("/applyOutDuty");
                          // Get.to(() => const ApplyOutDuty());
                        },
                        child: const Text('Apply Out Duty'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed("/applyLeave");
                        },
                        child: const Text('Apply Leave'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed("/applyOutDuty");
                        },
                        child: const Text('Apply Expanse Claim'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed("/applyLeave");
                        },
                        child: const Text('Profile'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showSuccessBottomSheet(
                        context,
                        "Successfully",
                        "Great It's working..!",
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Apply ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showErrorBottomSheet(
                        context,
                        "Oopsss...!",
                        "Please enter date..!",
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Error ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
