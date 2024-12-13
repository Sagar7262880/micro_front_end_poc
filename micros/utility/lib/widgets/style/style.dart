import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Style {
  InputDecoration getInputDecoration(
      String label, Icon? suffixIcon, Icon? prefixIcon) {
    const Color grey = Colors.grey;
    return InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      fillColor: Colors.white,
      filled: true,
      labelText: label,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      labelStyle: const TextStyle(color: Colors.black54, fontSize: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: grey, width: 0.0),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: grey, width: 0.0),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 0, color: grey),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 0, color: grey),
      ),
      counter: const Offstage(),
    );
  }
}
