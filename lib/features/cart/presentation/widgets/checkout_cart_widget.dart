import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/widgets/app_text_button.dart';

class CheckoutCartWidget extends StatelessWidget {
  const CheckoutCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: AppTextButton(
        textButton: 'Checkout',
        onPressed: () {},
      ),
    );
  }
}
