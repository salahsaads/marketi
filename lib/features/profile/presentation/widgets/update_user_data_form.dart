import 'package:flutter/material.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/widgets/app_text_button.dart';
import 'package:marketi/core/widgets/app_text_form_field.dart';
import 'package:marketi/features/auth/data/models/auth_response_model.dart';
import 'package:marketi/features/profile/data/models/update_request_body.dart';
import 'package:marketi/features/profile/presentation/logic/profile_cubit.dart';

class UpdateUserDataForm extends StatefulWidget {
  const UpdateUserDataForm({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.userModel,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final AuthResponseModel userModel;

  @override
  State<UpdateUserDataForm> createState() => _UpdateUserDataFormState();
}

class _UpdateUserDataFormState extends State<UpdateUserDataForm> {
  final GlobalKey<FormState> profileFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: profileFormKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: widget.nameController,
            textInputType: TextInputType.name,
            prefixIcon: const Icon(
              Icons.person_3_outlined,
              size: 24,
              color: Color(0xFF8CB3FF),
            ),
            validator: (val) {
              if (val!.isEmpty) {
                return 'لا يمكن ترك الاسم فارغ';
              }
            },
          ),
          verticalSpace(20),
          AppTextFormField(
            controller: widget.phoneController,
            textInputType: TextInputType.phone,
            prefixIcon: const Icon(
              Icons.phone_in_talk_outlined,
              size: 24,
              color: Color(0xFF8CB3FF),
            ),
            validator: (val) {
              if (val!.isEmpty) {
                return 'لا يمكن ترك رقم الهاتف فارغ';
              }
            },
          ),
          verticalSpace(20),
          AppTextFormField(
            controller: widget.emailController,
            textInputType: TextInputType.emailAddress,
            prefixIcon: const Icon(
              Icons.email_outlined,
              size: 24,
              color: Color(0xFF8CB3FF),
            ),
            validator: (val) {
              if (val!.isEmpty) {
                return 'لا يمكن ترك رقم الإيميل فارغ';
              }
            },
          ),
          verticalSpace(50),
          AppTextButton(
            textButton: 'تحديث',
            onPressed: () {
              if (profileFormKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();

                ProfileCubit.get(context).updateProfile(
                  UpdateRequestBody(
                    name: widget.nameController.text,
                    phone: widget.phoneController.text,
                    email: widget.emailController.text,
                    image: widget.userModel.data!.image!,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
