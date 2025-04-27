import 'package:flutter/material.dart';
import 'package:marketi/core/function/validators.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/widgets/app_text_button.dart';
import 'package:marketi/core/widgets/app_text_form_field.dart';
import 'package:marketi/features/auth/presentation/logic/register/register_cubit.dart';

class DataOfRegisterForm extends StatefulWidget {
  const DataOfRegisterForm({super.key});

  @override
  State<DataOfRegisterForm> createState() => _DataOfRegisterFormState();
}

class _DataOfRegisterFormState extends State<DataOfRegisterForm> {
  bool isObscureText = true;

  IconData visibility = Icons.visibility_off_rounded;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: RegisterCubit.get(context).formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('الإسم', style: AppStyles.style14Medium),
          verticalSpace(2),
          AppTextFormField(
            hintText: 'الإسم الكامل',
            textInputType: TextInputType.name,
            controller: RegisterCubit.get(context).nameController,
            prefixIcon: const Icon(Icons.person_4_outlined),
            validator: (value) {
              return nameValidator(value);
            },
          ),
          verticalSpace(8),
          Text('البريد الإلكتروني', style: AppStyles.style14Medium),
          verticalSpace(2),
          AppTextFormField(
            hintText: 'You@gmail.com',
            textInputType: TextInputType.emailAddress,
            controller: RegisterCubit.get(context).emailController,
            prefixIcon: const Icon(Icons.email_outlined),
            validator: (value) {
              return emailValidator(value);
            },
          ),
          verticalSpace(8),
          Text('كلمة المرور', style: AppStyles.style14Medium),
          verticalSpace(2),
          AppTextFormField(
            hintText: '*********',
            textInputType: TextInputType.visiblePassword,
            isObscureText: isObscureText,
            controller: RegisterCubit.get(context).passwordController,
            prefixIcon: const Icon(Icons.call),
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
          Text('رقم الهاتف', style: AppStyles.style14Medium),
          verticalSpace(2),
          AppTextFormField(
            hintText: '01256582438',
            textInputType: TextInputType.phone,
            controller: RegisterCubit.get(context).phoneController,
            prefixIcon: const Icon(Icons.lock_clock_outlined),
            validator: (value) {
              return phoneNumberValidator(value);
            },
          ),
          verticalSpace(32),
          AppTextButton(
            textButton: 'إنشاء حساب',
            onPressed: () {
              validateThenDoSignUp(context);
            },
          ),
          verticalSpace(32),
        ],
      ),
    );
  }

  void validateThenDoSignUp(BuildContext context) {
    if (RegisterCubit.get(context).formKey.currentState!.validate()) {
      RegisterCubit.get(context).emitRegisterStates();
    }
  }
}
