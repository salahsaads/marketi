import 'package:flutter/material.dart';
import 'package:marketi/core/routes/extentions.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/app_styles.dart';

class AreYouNewInMarketi extends StatelessWidget {
  const AreYouNewInMarketi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'أو تابع مع',
              style: AppStyles.style12Regular.copyWith(
                color: const Color(0xFF51526B),
              ),
            ),
          ],
        ),
        verticalSpace(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'هل أنت جديد في تطبيق ماركتي؟',
              style: AppStyles.style16Medium.copyWith(
                color: const Color(0xFF51526B),
              ),
            ),
            horizontalSpace(8),
            GestureDetector(
              onTap: () {
                context.navigateTo(Routes.signupScreen);
              },
              child: Text(
                'إنشاء حساب',
                style: AppStyles.style16Medium.copyWith(
                  color: const Color(0xFF3F80FF),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
