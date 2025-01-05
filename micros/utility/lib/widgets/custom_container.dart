import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/theme_controller.dart';


class CustomContainerWidget extends StatelessWidget {
  final Widget? child;
  final BoxDecoration? decoration;
  final double paddingTop;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  final double childPaddingTop;
  final double childPaddingLeft;
  final double childPaddingRight;
  final double childPaddingBottom;
  final double? height;
  final double? width;

  // Getting the ThemeController using GetX
  final ThemeController themeController = Get.find<ThemeController>();

  final Color? backgroundColor;

  CustomContainerWidget({
    super.key,
    this.backgroundColor,
    this.child,
    this.decoration,
    this.paddingTop = 0,
    this.paddingLeft = 0,
    this.paddingRight = 0,
    this.paddingBottom = 0,
    this.childPaddingTop = 20,
    this.childPaddingLeft = 20,
    this.childPaddingRight = 20,
    this.childPaddingBottom = 20,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the background color dynamically
    final Color resolvedBackgroundColor = backgroundColor ??
        (themeController.currentColor.value == "dr"
            ? Colors.grey[900]!
            : Colors.white);

    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      child: Container(
        decoration: decoration ??
            BoxDecoration(
              color: resolvedBackgroundColor,
            ),
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.only(
            top: childPaddingTop,
            bottom: childPaddingBottom,
            left: childPaddingLeft,
            right: childPaddingRight,
          ),
          child: child,
        ),
      ),
    );
  }
}
