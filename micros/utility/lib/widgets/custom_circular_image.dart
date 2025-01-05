import 'package:flutter/material.dart';

class CustomCircularImage extends StatelessWidget {
  final String imagePath;
  final double size;

  const CustomCircularImage({
    super.key,
    required this.imagePath,
    this.size = 70.0, // Default size
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: Image.asset(
        imagePath,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
