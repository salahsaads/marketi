import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/widgets/icon_navigate_pop.dart';
import 'package:marketi/features/auth/presentation/widgets/pin_put.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 14.w),
          child: Column(
            children: [
              Row(
                children: [
                  const IconNavigatePop(),
                  horizontalSpace(20),
                  Text('رمز التحقق', style: AppStyles.style16Medium),
                ],
              ),
              verticalSpace(57),
              Image.asset(
                  'assets/images/Illustration_Verification_Code_With_Email.png'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22),
                child: Text(
                  'الرجاء إدخال الرمز المكون من 4 أرقام المرسل إلى: You@gmail.com',
                  style: AppStyles.style16Medium,
                ),
              ),
              const PinCodeVerification(),
            ],
          ),
        )),
      ),
    );
  }
}
