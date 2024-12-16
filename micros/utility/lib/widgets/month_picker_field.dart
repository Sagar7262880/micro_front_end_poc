import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:intl/intl.dart';
import 'package:utility/constant/constant_string.dart';
import 'package:utility/utility.dart';

class MonthPickerField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final Icon? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final bool isReadOnly;
  final DateTime? initialDate;
  final String? validatorText;
  final bool isValidate;
  final InputDecoration? decoration;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateFormat? dateFormat;

  const MonthPickerField({
    Key? key,
    required this.label,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.isEnabled = true,
    this.isReadOnly = true,
    this.initialDate,
    this.hintText,
    this.isValidate = true,
    this.validatorText,
    this.decoration,
    this.firstDate,
    this.lastDate,
    this.dateFormat,
  }) : super(key: key);

  @override
  State<MonthPickerField> createState() => _MonthPickerFieldState();
}

class _MonthPickerFieldState extends State<MonthPickerField> {
  Future<void> _selectMonth(BuildContext context) async {
    final DateTime initialDate = widget.initialDate ?? DateTime.now();
    final DateTime firstDate = widget.firstDate ?? DateTime(2000);
    final DateTime lastDate = widget.lastDate ?? DateTime(2100);

    final DateTime? pickedDate = await showMonthPicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        widget.controller.text =
            (widget.dateFormat ?? DateFormat("MMMM yyyy")).format(pickedDate);
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
            await _selectMonth(context);
          }
        },
        readOnly: widget.isReadOnly,
        enabled: widget.isEnabled,
        validator: widget.validator ??
            (widget.isValidate
                ? (value) {
                    if (value == null || value.toString().isEmpty) {
                      return widget.validatorText ?? strPlzFillMonth;
                    }
                    return null;
                  }
                : null),
        decoration: customInputDecoration(
          labelText: widget.label,
          hintText: widget.hintText ?? "",
          // prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon ??
              Icon(
                Icons.calendar_month,
                size: 30,
                color: Get.theme.primaryColor,
              ),
        ),
      ),
    );
  }
}
