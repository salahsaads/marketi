import 'package:flutter/material.dart';
import 'package:marketi/core/function/validators.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/widgets/app_text_button.dart';
import 'package:marketi/core/widgets/app_text_form_field.dart';
import 'package:marketi/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:marketi/features/auth/presentation/widgets/checkbox_and_forgot_password.dart';

class DataOfLoginForm extends StatefulWidget {
  const DataOfLoginForm({super.key});

  @override
  State<DataOfLoginForm> createState() => _DataOfLoginFormState();
}

class _DataOfLoginFormState extends State<DataOfLoginForm> {
  bool isObscureText = true;

  IconData visibility = Icons.visibility_off_rounded;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginCubit.get(context).formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('البريد إلكتروني', style: AppStyles.style14Medium),
          verticalSpace(4),
          AppTextFormField(
            hintText: 'You@gmail.com',
            textInputType: TextInputType.emailAddress,
            controller: LoginCubit.get(context).emailController,
            prefixIcon: const Icon(Icons.email_outlined),
            validator: (value) {
              return emailValidator(value);
            },
          ),
          verticalSpace(14),
          Text('كلمة المرور', style: AppStyles.style14Medium),
          verticalSpace(4),
          AppTextFormField(
            hintText: '*********',
            textInputType: TextInputType.visiblePassword,
            controller: LoginCubit.get(context).passwordController,
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
          verticalSpace(7),
          const CheckBoxForgotPassword(),
          verticalSpace(14),
          AppTextButton(
            textButton: 'تسجيل الدخول',
            onPressed: () {
              validateThenNavigate(context);
            },
          ),
        ],
      ),
    );
  }

  void validateThenNavigate(context) {
    if (LoginCubit.get(context).formKey.currentState!.validate()) {
      LoginCubit.get(context).emitLoginStates();
    }
  }
}
