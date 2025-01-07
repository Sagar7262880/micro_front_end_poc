import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utility/utility.dart';

class CustomIconSwitchButton extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool initialValue;
  final Icon? icon1;
  final Icon? icon2;

  const CustomIconSwitchButton({
    Key? key,
    required this.onChanged,
    this.initialValue = true,
    this.icon1,
    this.icon2,
  }) : super(key: key);

  @override
  _CustomSwitchButtonState createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomIconSwitchButton> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _toggleValue(bool newValue) {
    // Only toggle the state if it's different from the current value
    if (_value != newValue) {
      setState(() {
        _value = newValue;
      });
      widget.onChanged(_value);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor1 = _value ? Get.theme.primaryColor : white;
    Color backgroundColor2 = _value ? white : Get.theme.primaryColor;

    // Determine icon color based on the switch value
    Color iconColor1 = _value ? Colors.white : Colors.grey;
    Color iconColor2 = !_value ? Colors.white : Colors.grey;

    Icon icon1 = widget.icon1 ?? Icon(Icons.check, color: iconColor1);
    Icon icon2 = widget.icon2 ?? Icon(Icons.close, color: iconColor2);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            if (!_value) {
              // Only toggle if the switch is off
              _toggleValue(true); // Switch to "on"
            }
          },
          child: getBorderedIcon(
              icon: icon1, backgroundColor: backgroundColor1, isRight: false),
        ),
        // SizedBox(width: 10),
        InkWell(
          onTap: () {
            if (_value) {
              // Only toggle if the switch is on
              _toggleValue(false); // Switch to "off"
            }
          },
          child: getBorderedIcon(
            icon: icon2,
            backgroundColor: backgroundColor2,
          ),
        ),
      ],
    );
  }

  Widget getBorderedIcon(
      {required Icon icon,
      required Color backgroundColor,
      bool isRight = true}) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: !isRight
            ? const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
            : const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
        border: Border.all(color: grey),
      ),
      child: icon,
    );
  }
}
