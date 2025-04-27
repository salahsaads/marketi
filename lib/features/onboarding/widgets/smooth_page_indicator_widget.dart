import 'package:flutter/material.dart';
import 'package:marketi/core/theme/colors.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndicatorWidget extends StatelessWidget {
  const SmoothPageIndicatorWidget({
    super.key,
    required this.length,
    required this.controller,
  });

  final int length;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: length,
      axisDirection: Axis.horizontal,
      effect: const SlideEffect(
        spacing: 8.0,
        radius: 10.0,
        dotWidth: 14.0,
        dotHeight: 16.0,
        paintStyle: PaintingStyle.fill,
        strokeWidth: 1.5,
        dotColor: ColorsManager.lightBlue,
        activeDotColor: ColorsManager.darkBlue,
      ),
    );
  }
}
