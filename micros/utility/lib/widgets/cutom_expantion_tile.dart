import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final Widget title; // Title is now a Widget
  final Widget? subtitle; // Subtitle as a Widget for consistency
  final Widget? leading;
  final List<Widget> children;
  final Color? backgroundColor;
  final Color? expandedBackgroundColor;
  final EdgeInsetsGeometry? tilePadding;
  final EdgeInsetsGeometry? childrenPadding;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.leading,
    required this.children,
    this.backgroundColor,
    this.expandedBackgroundColor,
    this.tilePadding,
    this.childrenPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide:
                BorderSide(color: backgroundColor ?? Colors.transparent)),
        color: backgroundColor,
        child: ExpansionTile(
          leading: leading,
          title: title,
          // Title is a Widget
          subtitle: subtitle,
          tilePadding: tilePadding,

          // Subtitle is also a Widget
          children: [
            const Divider(
              endIndent: 12,
              indent: 12,
            ),
            Container(
              color: expandedBackgroundColor ?? backgroundColor,
              padding: childrenPadding,
              child: Column(children: children),
            ),
          ],
        ),
      ),
    );
  }
}
