import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/function/validators.dart';
import 'package:marketi/core/routes/extentions.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/widgets/app_text_button.dart';
import 'package:marketi/core/widgets/app_text_form_field.dart';
import 'package:marketi/core/widgets/icon_navigate_pop.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 14.w),
            child: Form(
              child: Column(
                children: [
                  Row(
                    children: [
                      const IconNavigatePop(),
                      horizontalSpace(20),
                      Text('نسيت كلمة السر', style: AppStyles.style16Medium),
                    ],
                  ),
                  verticalSpace(57),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          'assets/images/Illustration_Forgot_Password_With_Email.png'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 22),
                        child: Text(
                          'الرجاء إدخال عنوان بريدك الإلكتروني لتلقي رمز التحقق',
                          textAlign: TextAlign.center,
                          style: AppStyles.style16Medium,
                        ),
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child:
                                Text('الإيميل', style: AppStyles.style14Medium),
                          ),
                          verticalSpace(4),
                          AppTextFormField(
                            hintText: 'You@gmail.com',
                            textInputType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.email_outlined),
                            validator: (value) {
                              return emailValidator(value);
                            },
                          ),
                          verticalSpace(22),
                          AppTextButton(
                            textButton: 'إرسال الرمز',
                            onPressed: () {
                              context.navigateTo(Routes.verificationCodeScreen);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
