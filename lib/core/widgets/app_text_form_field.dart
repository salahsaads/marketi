import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_styles.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isObscureText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final Color? backGroundColorHint;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Function(String? value)? onChanged;

  const AppTextFormField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.isObscureText,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.contentPadding,
    this.hintTextStyle,
    this.backGroundColorHint,
    required this.textInputType,
    this.controller,
    required this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        style: inputTextStyle ?? AppStyles.style20Medium,
        controller: controller,
        keyboardType: textInputType,
        onChanged: onChanged,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xB2B2CCFF),
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xB2B2CCFF),
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          hintText: hintText,
          hintStyle: hintTextStyle ??
              AppStyles.style16Regular.copyWith(
                color: const Color(0xFF919AAB),
              ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: backGroundColorHint ?? Colors.white,
          filled: true,
        ),
        obscureText: isObscureText ?? false,
        validator: (value) {
          return validator(value);
        },
      ),
    );
  }
}
