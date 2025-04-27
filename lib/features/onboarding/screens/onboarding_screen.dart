// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:marketi/features/onboarding/models/list_data.dart';
import 'package:marketi/features/onboarding/widgets/build_item_onboarding.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PageView.builder(
        itemBuilder: (context, index) => BuildItemOnBoarding(index: index),
        itemCount: onBoardingList.length,
        controller: onBoardingController,
      ),
    );
  }
}
