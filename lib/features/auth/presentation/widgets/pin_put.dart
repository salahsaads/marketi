import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/routes/extentions.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/widgets/app_text_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerification extends StatefulWidget {
  const PinCodeVerification({super.key});

  @override
  State<PinCodeVerification> createState() => _PinCodeVerificationState();
}

class _PinCodeVerificationState extends State<PinCodeVerification> {
  TextEditingController textEditingController = TextEditingController();

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 22.h),
      child: Column(
        children: [
          PinCodeTextField(
            appContext: context,
            length: 4,
            obscureText: false,
            obscuringCharacter: '*',
            blinkWhenObscuring: true,
            animationType: AnimationType.fade,
            cursorColor: Colors.black,
            animationDuration: const Duration(milliseconds: 300),
            enableActiveFill: true,
            controller: textEditingController,
            pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 64.h,
                fieldWidth: 64.w,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                inactiveColor: Colors.blue),
            keyboardType: TextInputType.number,
            onCompleted: (v) {
              debugPrint("Completed");
            },
            onChanged: (value) {
              debugPrint(value);
              setState(() {
                currentText = value;
              });
            },
          ),
          AppTextButton(
            textButton: 'التحقق من الكود',
            onPressed: () {
              context.navigateTo(Routes.changePasswordScreen);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 22.h),
            child: Text(
              '00:46',
              style: AppStyles.style16SemiBold,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'إعادة إرسال الرمز',
              style: AppStyles.style16SemiBold,
            ),
          ),
        ],
      ),
    );
  }

  Timer timer() => Timer.periodic(const Duration(seconds: 50), (timer) {});
}
