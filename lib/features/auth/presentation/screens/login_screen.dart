import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/animations/screen_animation.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/features/auth/presentation/widgets/are_you_new_in_marketi.dart';
import 'package:marketi/features/auth/presentation/widgets/data_of_login_form.dart';
import 'package:marketi/features/auth/presentation/widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: LoginBlocListener(
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    animationFadeInRight(
                      700,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/Logo_Log_In.png'),
                        ],
                      ),
                    ),
                    verticalSpace(32),
                    const DataOfLoginForm(),
                    verticalSpace(14),
                    const AreYouNewInMarketi(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
