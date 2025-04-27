import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_styles.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.textStyle,
    this.buttonWidth,
    this.buttonHeight,
    this.backgroundColor,
    this.borderRadius,
    this.verticalPadding,
    this.horizontalPadding,
  });

  final String textButton;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: buttonWidth ?? double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 14.h,
          horizontal: horizontalPadding ?? 12.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          color: backgroundColor ?? const Color(0xFF3F80FF),
        ),
        child: Text(
          textAlign: TextAlign.center,
          textButton,
          style: textStyle ?? AppStyles.style18Medium,
        ),
      ),
    );
  }
}
