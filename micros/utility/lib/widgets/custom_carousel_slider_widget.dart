import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarouselSlider extends StatefulWidget {
  final int itemCount;
  final ExtendedIndexedWidgetBuilder itemBuilder;  // Updated type
  final double height;
  final Duration autoPlayInterval;
  final Duration autoPlayAnimationDuration;
  final double viewportFraction;

  const CustomCarouselSlider({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.height = 140.0,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
    this.viewportFraction = 1.0,
  });

  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _current = 0;
  late final CarouselSliderController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.itemCount,
          carouselController: _controller,
          options: CarouselOptions(
            height: widget.height,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: widget.autoPlayInterval,
            autoPlayAnimationDuration: widget.autoPlayAnimationDuration,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            viewportFraction: widget.viewportFraction,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: widget.itemBuilder,  // Use ExtendedIndexedWidgetBuilder
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.itemCount, (index) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(index),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                      .withOpacity(_current == index ? 0.9 : 0.3),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
