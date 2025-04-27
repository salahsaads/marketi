import 'package:flutter/material.dart';
import 'package:marketi/core/animations/build_animation.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/features/onboarding/widgets/build_item_onboarding.dart';

class TextOnBoarding extends StatelessWidget {
  const TextOnBoarding({
    super.key,
    required this.widget,
  });

  final BuildItemOnBoarding widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        animationText(
          widget.index!,
          400,
          Text(
            model[widget.index!].title,
            textAlign: TextAlign.center,
            style: AppStyles.style20SemiBold,
          ),
        ),
        verticalSpace(44),
        animationText(
          widget.index!,
          500,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              model[widget.index!].body,
              style: AppStyles.style14Medium.copyWith(height: 0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
