import 'package:flutter/material.dart';
import 'package:utility/utility.dart';

class CustomOutlinedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;
  final Color? color;
  final Color? backgroundColor;
  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color,
    this.backgroundColor,
  });

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return OutlinedButton(
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
