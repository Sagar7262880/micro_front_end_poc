import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  const CustomCardView({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.elevation = 4.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: elevation!,
        color: backgroundColor,
        borderRadius: borderRadius,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: ListTile(
            leading: leading,
            title: title,
            subtitle: subtitle,
            trailing: trailing,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}