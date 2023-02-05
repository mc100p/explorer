import 'dart:math';

import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  // The base size of the dots
  static const double _kDotSize = 4.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 20.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 35.0;

  final Color _selectedColor = Color.fromARGB(255, 249, 249, 249);

  final Color _notSelected = Color.fromARGB(255, 144, 144, 144);

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 20.0 + (_kMaxZoom - 1.0) * selectedness;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: new Container(
        width: _kDotSpacing,
        child: new Center(
          child: new Material(
            color: zoom > 30.0 ? _selectedColor : _notSelected,
            type: MaterialType.card,
            child: new Container(
              width: _kDotSize * zoom,
              height: _kDotSize * 0.5,
              child: new InkWell(
                onTap: () => onPageSelected(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
