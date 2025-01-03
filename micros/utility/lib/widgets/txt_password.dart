import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../constant/constant_string.dart';

class TxtPassword extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? formatters;
  final int? maxLength;
  final void Function()? onTap;
  final void Function(dynamic)? onChanged;
  final String? Function(dynamic)? validator;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final bool isEnabled;
  final bool isReadOnly;
  final int maxLines;
  final String? hintText;
  final String? validatorText;
  final bool isValidate;

  const TxtPassword(
      {Key? key,
      required this.label,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.formatters,
      this.maxLength,
      this.onTap,
      this.onChanged,
      this.validator,
      this.suffixIcon,
      this.prefixIcon,
      this.isEnabled = true,
      this.isReadOnly = false,
      this.maxLines = 1,
      this.hintText,
      this.validatorText,
      this.isValidate = true});

  @override
  State<TxtPassword> createState() => _TxtPasswordState();
}

class _TxtPasswordState extends State<TxtPassword> {
  bool isObscare = true;

  @override
  Widget build(BuildContext context) {
    const Color grey = Colors.grey; // Replace with your desired color if needed

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textAlign: TextAlign.left,
        //style: const TextStyle(color: Colors.black, fontSize: 16),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onTap: widget.onTap,

        maxLines: widget.maxLines,
        enabled: widget.isEnabled,
        // validator: widget.validator,
        readOnly: widget.isReadOnly,
        onChanged: widget.onChanged,
        inputFormatters: widget.formatters ?? [],
        maxLength: widget.maxLength,
        validator: widget.validator ??
            (widget.isValidate
                ? (value) {
                    if (value == null || value.toString().isEmpty) {
                      return widget.validatorText ?? strPlzFill;
                    }
                    return null;
                  }
                : null),
        obscureText: isObscare,
        decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hintText ?? "",
            suffixIcon: widget.suffixIcon != null
                ? IconButton(
                    color: !isObscare ? Get.theme.primaryColor : grey,
                    icon: widget.suffixIcon!,
                    onPressed: () {
                      setState(() {
                        isObscare = !isObscare;
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(
                      color: !isObscare ? Get.theme.primaryColor : grey,
                      Icons.remove_red_eye_sharp,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscare = !isObscare;
                      });
                    },
                  )),

        /* decoration: customInputDecoration(
            labelText: widget.label,
            hintText: widget.hintText ?? "",
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon),*/
      ),
    );
  }
}
