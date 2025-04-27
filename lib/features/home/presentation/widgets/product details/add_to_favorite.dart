import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';
import 'package:marketi/features/home/presentation/widgets/product%20details/favorite_icon.dart';

class AddToFavorite extends StatelessWidget {
  const AddToFavorite({
    super.key,
    required this.model,
  });

  final ProductDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 142.w,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.w,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: const Color(0xFF3F80FF),
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'التسوق مجانا',
            textAlign: TextAlign.center,
            style: AppStyles.style18Medium.copyWith(
              color: const Color(0xFF3F80FF),
            ),
          ),
        ),
        FavoriteIcon(model: model),
      ],
    );
  }
}
