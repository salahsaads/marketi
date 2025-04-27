import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/widgets/icon_navigate_pop.dart';
import 'package:marketi/features/auth/presentation/widgets/data_of_register_form.dart';
import 'package:marketi/features/auth/presentation/widgets/register_bloc_listener.dart';
import 'package:marketi/features/auth/presentation/widgets/select_profile_image.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: RegisterBlocListener(
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 14.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IconNavigatePop(),
                  verticalSpace(18),
                  const SelectProfileImage(),
                  verticalSpace(18),
                  const DataOfRegisterForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
