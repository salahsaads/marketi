import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/routes/extentions.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/widgets/app_text_button.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/images/Illustration_Cart_Empty.png'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22),
            child: Text(
              'Your Cart is Empty',
              style: AppStyles.style24Medium,
            ),
          ),
          Text(
            'Check our big offers, fresh products\nand fill your cart with items',
            textAlign: TextAlign.center,
            style: AppStyles.style16Medium,
          ),
          verticalSpace(30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: AppTextButton(
              textButton: 'Start Shopping',
              onPressed: () {
                context.navigateToReplacement(Routes.navBarLayout);
              },
            ),
          )
        ],
      )),
    );
  }
}
