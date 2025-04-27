import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/animations/build_animation.dart';
import 'package:marketi/core/cache/shared_pref_helper.dart';
import 'package:marketi/core/cache/shared_pref_keys.dart';
import 'package:marketi/core/routes/extentions.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/widgets/app_text_button.dart';
import 'package:marketi/features/onboarding/models/list_data.dart';
import 'package:marketi/features/onboarding/models/onboarding_model.dart';
import 'package:marketi/features/onboarding/widgets/text_onboarding.dart';

import 'smooth_page_indicator_widget.dart';

// ignore: must_be_immutable
class BuildItemOnBoarding extends StatefulWidget {
  BuildItemOnBoarding({super.key, this.index});
  int? index;

  @override
  State<BuildItemOnBoarding> createState() => _BuildItemOnBoardingState();
}

PageController onBoardingController = PageController();

List<OnBoardingModel> model = onBoardingList;

class _BuildItemOnBoardingState extends State<BuildItemOnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              EdgeInsets.only(right: 14.w, left: 14.w, top: 90.h, bottom: 48.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              animationImage(
                widget.index!,
                400,
                Container(
                  height: 256.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: SvgPicture.asset(model[widget.index!].image),
                ),
              ),
              verticalSpace(24),
              animationText(
                widget.index!,
                700,
                SmoothPageIndicatorWidget(
                  length: onBoardingList.length,
                  controller: onBoardingController,
                ),
              ),
              verticalSpace(24),
              TextOnBoarding(widget: widget),
              const Spacer(),
              AppTextButton(
                textStyle: AppStyles.style18Medium,
                textButton: model[widget.index!].textButton,
                onPressed: () {
                  onDotClicked(context);
                },
                buttonHeight: 48,
                buttonWidth: 347,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onDotClicked(BuildContext context) {
    if (widget.index! != 2) {
      setState(() {
        onBoardingController.animateToPage(
          widget.index! + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      });
    } else {
      submitOnBoarding(context);
    }
  }
}

void submitOnBoarding(BuildContext context) {
  context.navigateToReplacement(Routes.loginScreen);

  CacheHelper.saveData(key: SharedPrefKeys.onboarding, value: true);
}
