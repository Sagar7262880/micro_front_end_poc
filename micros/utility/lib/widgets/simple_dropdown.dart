import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:utility/widgets/style/custom_decoration.dart';

import '../constant/constant_string.dart';

class SimpleDropdown extends StatefulWidget {
  final String labelText;
  final List<String> items;
  final void Function(String? value) onChanged;
  final bool isSearchable;
  final AxisDirection axisDirection;
  final Icon? suffixIcon;
  final String? Function(dynamic value)? validator;
  final String? validatorText;
  final bool isValidate;

  const SimpleDropdown({
    Key? key,
    required this.labelText,
    required this.items,
    required this.onChanged,
    this.isSearchable = true,
    this.axisDirection = AxisDirection.down,
    this.suffixIcon,
    this.validator,
    this.isValidate = true,
    this.validatorText,
  }) : super(key: key);

  @override
  State<SimpleDropdown> createState() => _StatefulDropdownState();
}

class _StatefulDropdownState extends State<SimpleDropdown> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode.addListener(_onFocusChange);
    // if (widget.validator == null) {}
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isKeyboardVisible = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color grey = Colors.grey; // Default grey color
    const Color white = Colors.white;

    final Icon suffixIcon = widget.suffixIcon ??
        Icon(
          Icons.arrow_drop_down,
          color: Theme.of(context).primaryColor,
          size: 30,
        );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              _isKeyboardVisible = true;
            },
            child: TypeAheadFormField<String>(
              suggestionsBoxVerticalOffset: 4,
              direction: widget.axisDirection,
              textFieldConfiguration: TextFieldConfiguration(
                controller: _controller,
                focusNode: _focusNode,
                enableSuggestions: true,
                decoration: InputDecoration(// isEnabled: widget.isEnabled,
                  // prefixIcon: Ic,
                  labelText: widget.labelText,
                  // hintText: widget.hintText ?? "",
                  suffixIcon: suffixIcon, hintText: '')
                /*style: const TextStyle(color: Colors.black, fontSize: 16),
                decoration: customInputDecoration(
                  // isEnabled: widget.isEnabled,
                  // prefixIcon: Ic,
                  labelText: widget.labelText,
                  // hintText: widget.hintText ?? "",
                  suffixIcon: suffixIcon, hintText: '',
                ),*/
              ),
              suggestionsCallback: (pattern) {
                if (widget.isSearchable) {
                  return widget.items
                      .where((e) =>
                          e.toUpperCase().contains(pattern.toUpperCase()))
                      .toList();
                } else {
                  return widget.items;
                }
              },
              itemBuilder: (context, String suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (String suggestion) {
                _controller.text = suggestion;
                widget.onChanged(suggestion);
              },
              hideKeyboard: !widget.isSearchable,
              noItemsFoundBuilder: (context) => const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'No items found',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              validator: widget.validator ??
                  (widget.isValidate
                      ? (value) {
                          if (value == null || value.toString().isEmpty) {
                            return widget.validatorText ?? strPlzFill;
                          }
                          return null;
                        }
                      : null),
              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                borderRadius: BorderRadius.circular(10),
                elevation: 8.0,
                shadowColor: Colors.black45,
                scrollbarThumbAlwaysVisible: true,
                //color: Colors.white,
                constraints: const BoxConstraints(
                  maxHeight: 230.0,
                ),
              ),
              hideSuggestionsOnKeyboardHide: false,
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
