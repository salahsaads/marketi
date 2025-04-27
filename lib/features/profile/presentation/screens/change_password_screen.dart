import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/widgets/icon_navigate_pop.dart';
import 'package:marketi/features/profile/presentation/widgets/change_password_bloc_listener.dart';
import 'package:marketi/features/profile/presentation/widgets/change_password_form.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangePasswordBlocListener(
      child: Directionality(
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
                    Text(
                      'إنشاء كلمة مرور جديدة',
                      style: AppStyles.style24Medium,
                    ),
                  ],
                ),
                verticalSpace(57),
                Image.asset(
                    'assets/images/Illustration_Create_New_Password.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child: Text(
                    'يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمة المرور الأخيرة',
                    style: AppStyles.style16Medium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const ChangePasswordForm(),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
