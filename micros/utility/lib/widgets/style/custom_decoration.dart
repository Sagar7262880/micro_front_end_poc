import 'package:flutter/material.dart';

InputDecoration customInputDecoration(
    {required String labelText,
    required String hintText,
    Color? fillColor,
    Icon? prefixIcon,
    String? prefixText = '',
    Icon? suffixIcon,
    bool? isEnabled}) {
  return InputDecoration(
    // labelText: labelText,
    hintText: hintText,

    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.all(10),
    // fillColor:
    //     isEnabled ?? true ? Colors.white : Colors.white38.withOpacity(0.2),
    filled: true,
    labelText: labelText,
    prefixIcon: prefixIcon,

    labelStyle: const TextStyle(color: Colors.black54, fontSize: 16),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey, width: 0.0),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey, width: 0.0),
    ),
    focusedBorder: OutlineInputBorder(
      // borderRadius: BorderRadius.all(Radius.circular(4)),
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 0, color: Colors.grey),
    ),
    disabledBorder: OutlineInputBorder(
      // borderRadius: BorderRadius.all(Radius.circular(4)),
      borderRadius: BorderRadius.circular(10),

      borderSide: BorderSide(width: 0, color: Colors.grey),
    ),
  );
}
