import 'package:flutter/material.dart';
import 'package:utility/utility.dart';

import '../constant/constant_string.dart';

class DatePickerField extends StatefulWidget {
  final String label;
  final String? hintText;

  final TextEditingController controller;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final bool isReadOnly;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? validatorText;
  final bool isValidate;

  const DatePickerField({
    Key? key,
    required this.label,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.isEnabled = true,
    this.isReadOnly = true, // Default is readonly because it's a date picker
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.hintText,
    this.isValidate = true,
    this.validatorText,
  }) : super(key: key);

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  Future<void> _selectDate(BuildContext context) async {
    print('sdfcsj');
    final DateTime currentDate = widget.initialDate ?? DateTime.now();
    final DateTime firstDate = widget.firstDate ?? DateTime(2000);
    final DateTime lastDate = widget.lastDate ?? DateTime(2100);
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (pickedDate != null) {
      setState(() {
        // widget.controller.text = pickedDate.toLocal().toString();

        widget.controller.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textAlign: TextAlign.left,
        //style: const TextStyle(color: Colors.black, fontSize: 16),
        controller: widget.controller,
        onTap: () async {
          if (widget.isEnabled) {
            // await   _selectDate(context);\
            // final DateTime currentDate = widget.initialDate ?? DateTime.now();
            // final DateTime firstDate = widget.firstDate ?? DateTime(2000);
            // final DateTime lastDate = widget.lastDate ?? DateTime(2100);
            _selectDate(
              context,
            );
          }
        },
        readOnly: widget.isReadOnly,
        enabled: widget.isEnabled,
        // validator: widget.validator,
        validator: widget.validator ??
            (widget.isValidate
                ? (value) {
                    if (value == null || value.toString().isEmpty) {
                      return widget.validatorText ?? strPlzFillDate;
                    }
                    return null;
                  }
                : null),
        decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hintText ?? "",
            suffixIcon: widget.suffixIcon ??
                Icon(
                  Icons.calendar_month,
                  size: 30,
                  color: Get.theme.primaryColor,
                )),
        /*decoration: customInputDecoration(
            isEnabled: widget.isEnabled,
            labelText: widget.label,
            hintText: widget.hintText ?? "",
            suffixIcon: widget.suffixIcon ??
                Icon(
                  Icons.calendar_month,
                  size: 30,
                  color: Get.theme.primaryColor,
                )),*/
      ),
    );
  }
}
