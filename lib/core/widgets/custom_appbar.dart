import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/widgets/icon_navigate_pop.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.image,
    this.count,
  });

  final String title;
  final int? count;

  final String? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const IconNavigatePop(),
          Text(title, style: AppStyles.style20SemiBold),
          Badge.count(
            count: count ?? 0,
            child: Image.asset(
              image ?? 'assets/images/Pic.png',
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
