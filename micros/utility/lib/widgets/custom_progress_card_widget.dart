import 'package:flutter/material.dart';

class CustomProgressCard extends StatelessWidget {
  final int currentValue;
  final int maxValue;
  final String label;
  final double progress; // A value between 0.0 and 1.0

  const CustomProgressCard({
    super.key,
    required this.currentValue,
    required this.maxValue,
    required this.label,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$currentValue',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      '/$maxValue',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),

                Container(
                  width: 70,
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: CircularProgressIndicator(
                backgroundColor: Colors.purple.withOpacity(0.2),
                color: Theme.of(context).primaryColor,
                strokeWidth: 7,
                value: progress,
                strokeAlign: 2,// Dynamic value
              ),
            ),
          ],
        ),
      ),
    );
  }
}
