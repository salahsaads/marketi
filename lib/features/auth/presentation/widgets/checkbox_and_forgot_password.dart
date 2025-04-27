import 'package:flutter/material.dart';
import 'package:marketi/core/routes/extentions.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/app_styles.dart';

class CheckBoxForgotPassword extends StatelessWidget {
  const CheckBoxForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {},
        ),
        Text(
          'تذكرني',
          style: AppStyles.style12Regular.copyWith(
            color: const Color(0xFF51526B),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context.navigateTo(Routes.resetPasswordScreen);
          },
          child: Text(
            'نسيت كلمة المرور',
            style: AppStyles.style12Medium.copyWith(
              color: const Color(0xFF3F80FF),
            ),
          ),
        ),
      ],
    );
  }
}
