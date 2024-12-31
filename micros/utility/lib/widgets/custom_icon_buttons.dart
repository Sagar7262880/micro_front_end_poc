import 'package:flutter/material.dart';
import 'package:utility/utility.dart';

class CustomIconButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData hugeIcon;
  final Color? color;
  final Color? backgroundColor;
  const CustomIconButton(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.hugeIcon,
      this.color,
      this.backgroundColor});

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: widget.onPressed,
      label: Text(
        widget.label,
      ),
      icon: HugeIcon(
        icon: widget.hugeIcon,
        color: widget.color ?? Colors.white,
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          widget.backgroundColor,
        ),
      ),
    );
  }
}
