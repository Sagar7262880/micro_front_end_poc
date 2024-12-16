import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:utility/constant/constant_string.dart';
import 'package:utility/utility.dart';

class DynamicDropDown extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isSearchable;
  final void Function(dynamic value) onChanged;
  final void Function(dynamic value) onSuggestionSelected;
  final FutureOr<Iterable<dynamic>> Function(dynamic) onSuggestionCallBack;
  final Widget Function(BuildContext context, dynamic) suggestionBuilder;
  final String? Function(dynamic value)? validator;
  final String? validatorText;
  final bool isValidate;
  final AxisDirection axisDirection;

  const DynamicDropDown({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    required this.onSuggestionSelected,
    required this.onSuggestionCallBack,
    required this.suggestionBuilder,
    this.validator,
    this.isValidate = true,
    this.validatorText,
    this.axisDirection = AxisDirection.down,
    this.isSearchable = false,
  });

  @override
  _DynamicDropDownState createState() => _DynamicDropDownState();
}

class _DynamicDropDownState extends State<DynamicDropDown> {
  final FocusNode _focusNode = FocusNode();
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    if (widget.validator == null) {}
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isKeyboardVisible = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              _isKeyboardVisible = true;
            },
            child: TypeAheadFormField(
              direction: widget.axisDirection,
              textFieldConfiguration: TextFieldConfiguration(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  onChanged: widget.onChanged,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  decoration: customInputDecoration(
                    labelText: widget.labelText,
                    hintText: widget.labelText,
                    suffixIcon: Icon(
                      Icons.arrow_drop_down,
                      color: Get.theme.primaryColor,
                      size: 30,
                    ),
                  )),

              validator: widget.validator ??
                  (widget.isValidate
                      ? (value) {
                          if (value == null || value.toString().isEmpty) {
                            return widget.validatorText ?? strPlzFill;
                          }
                          return null;
                        }
                      : null),

              suggestionsCallback: widget.onSuggestionCallBack,
              itemBuilder: widget.suggestionBuilder,
              onSuggestionSelected: widget.onSuggestionSelected,
              hideKeyboard: !widget.isSearchable,
              getImmediateSuggestions: true,
              noItemsFoundBuilder: (context) => const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'No items found',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                borderRadius: BorderRadius.circular(10),
                elevation: 8.0,
                shadowColor: Colors.black45,
                scrollbarThumbAlwaysVisible: true,
                color: Colors.white,
                constraints: const BoxConstraints(
                  maxHeight: 230.0,
                ),
              ),
              hideSuggestionsOnKeyboardHide: false,
              // Keep the suggestions visible even when the keyboard is up
              // hideKeyboardOnDrag: true,
            ),
          ),
          _focusNode.hasFocus
              ? const SizedBox(
                  height: 200,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
