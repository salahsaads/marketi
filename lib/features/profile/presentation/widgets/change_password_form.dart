import 'package:flutter/material.dart';
import 'package:marketi/core/function/validators.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/widgets/app_text_button.dart';
import 'package:marketi/core/widgets/app_text_form_field.dart';
import 'package:marketi/features/profile/presentation/logic/profile_cubit.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

bool isObscureText = true;

IconData visibility = Icons.visibility_off_rounded;

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('كلمة المرور الحالية', style: AppStyles.style14Medium),
          verticalSpace(4),
          AppTextFormField(
            hintText: '*********',
            textInputType: TextInputType.visiblePassword,
            controller: ProfileCubit.get(context).currentPasswordController,
            isObscureText: isObscureText,
            prefixIcon: const Icon(Icons.lock_clock_outlined),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText == true ? visibility : Icons.visibility,
              ),
            ),
            validator: (value) {
              return passwordValidator(value);
            },
          ),
          verticalSpace(8),
          Text('كلمة المرور الجديدة', style: AppStyles.style14Medium),
          verticalSpace(4),
          AppTextFormField(
            hintText: '*********',
            textInputType: TextInputType.visiblePassword,
            controller: ProfileCubit.get(context).newPasswordController,
            isObscureText: isObscureText,
            prefixIcon: const Icon(Icons.lock_clock_outlined),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText == true ? visibility : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value ==
                  ProfileCubit.get(context).currentPasswordController.text) {
                return 'يجب ادخال كلمة مرور جديدة';
              }
            },
          ),
          verticalSpace(22),
          AppTextButton(
            textButton: 'حفظ كلمة المرور',
            onPressed: () {
              validateToChangePassword(context);
            },
          ),
        ],
      ),
    );
  }

  void validateToChangePassword(BuildContext context) {
    if (formKey.currentState!.validate()) {
      ProfileCubit.get(context).changePassword();
    }
  }
}
