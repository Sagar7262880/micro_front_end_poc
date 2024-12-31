import 'package:flutter/material.dart';

class CustomSwitchButton extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final String label;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? backgroundColor;

  const CustomSwitchButton({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.label,
    this.activeColor,
    this.inactiveColor,
    this.backgroundColor,
  });

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  late bool _isSwitched;

  @override
  void initState() {
    super.initState();
    _isSwitched = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: width * 0.03,
            color: _isSwitched ? widget.activeColor : widget.inactiveColor,
          ),
        ),
        SizedBox(
          width: width * 0.02,
        ),
        Switch(
          value: _isSwitched,
          onChanged: (value) {
            setState(() {
              _isSwitched = value;
            });
            widget.onChanged(value);
          },
          activeColor: widget.activeColor,
          inactiveThumbColor: widget.inactiveColor,
        ),
      ],
    );
  }
}
