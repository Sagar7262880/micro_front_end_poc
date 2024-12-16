import 'package:flutter/material.dart';
import 'package:utility/utility.dart';
import '../constant/constant_string.dart';

class TimePickerField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final bool isReadOnly;
  final TimeOfDay? initialTime;
  final String? validatorText;
  final bool isValidate;

  const TimePickerField({
    Key? key,
    required this.label,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.isEnabled = true,
    this.isReadOnly = true,
    this.initialTime,
    this.hintText,
    this.isValidate = true,
    this.validatorText,
  }) : super(key: key);

  @override
  State<TimePickerField> createState() => _TimePickerFieldState();
}

class _TimePickerFieldState extends State<TimePickerField> {
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay currentTime = widget.initialTime ?? TimeOfDay.now();
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
    );

    if (pickedTime != null) {
      setState(() {
        widget.controller.text = pickedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textAlign: TextAlign.left,
        style: const TextStyle(color: Colors.black, fontSize: 16),
        controller: widget.controller,
        onTap: () async {
          if (widget.isEnabled) {
            _selectTime(context);
          }
        },
        readOnly: widget.isReadOnly,
        enabled: widget.isEnabled,
        validator: widget.validator ??
            (widget.isValidate
                ? (value) {
                    if (value == null || value.toString().isEmpty) {
                      return widget.validatorText ?? strPlzFillTime;
                    }
                    return null;
                  }
                : null),
        decoration: customInputDecoration(
          isEnabled: widget.isEnabled,
          labelText: widget.label,
          hintText: widget.hintText ?? "",
          suffixIcon: widget.suffixIcon ??
              Icon(
                Icons.access_time,
                size: 30,
                color: Get.theme.primaryColor,
              ),
        ),
      ),
    );
  }
}
