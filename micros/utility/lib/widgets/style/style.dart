
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Style {
  getInputDecoration(String )
  {
   return  InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      fillColor: Colors.white,
      filled: true,
      labelText: widget.label,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
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
    )
  }
}