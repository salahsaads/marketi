import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/di/dependency_injection.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/widgets/icon_navigate_pop.dart';
import 'package:marketi/features/auth/data/models/auth_response_model.dart';
import 'package:marketi/features/profile/presentation/logic/profile_cubit.dart';
import 'package:marketi/features/profile/presentation/logic/profile_state.dart';
import 'package:marketi/features/profile/presentation/widgets/image_personal_info.dart';
import 'package:marketi/features/profile/presentation/widgets/update_user_data_form.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key, required this.userModel});

  final AuthResponseModel userModel;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    nameController.text = userModel.data!.name!;
    phoneController.text = userModel.data!.phone!;
    emailController.text = userModel.data!.email!;

    return BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 40.h,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const IconNavigatePop(),
                            horizontalSpace(20),
                            Text(
                              'المعلومات الشخصية',
                              style: AppStyles.style24Medium,
                            ),
                          ],
                        ),
                        verticalSpace(30),
                        ImagePersonalInfo(userModel: userModel),
                        verticalSpace(30),
                        UpdateUserDataForm(
                          nameController: nameController,
                          phoneController: phoneController,
                          emailController: emailController,
                          userModel: userModel,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
