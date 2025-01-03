import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;
  final Color? color;
  final Color? backgroundColor;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color,
    this.backgroundColor,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          widget.backgroundColor,
        ),
      ),
      child: Text(
        widget.label,
        style: TextStyle(
          fontSize: width * 0.03,
        ),
      ),
    );
  }
}
