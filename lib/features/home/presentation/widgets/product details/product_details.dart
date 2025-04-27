import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';

import 'add_to_cart.dart';
import 'add_to_favorite.dart';
import 'product_description.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.model,
  });

  final ProductDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Color(0xFFF4FAFF),
        boxShadow: [
          BoxShadow(
            color: Color(0x7FB2CCFF),
            blurRadius: 10,
            offset: Offset(0, -1),
            spreadRadius: 0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
        horizontal: 14.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddToFavorite(model: model),
          verticalSpace(14),
          Expanded(child: ProductDescription(model: model)),
          verticalSpace(4),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'السعر',
                    style: AppStyles.style20SemiBold
                        .copyWith(color: const Color(0xFF3F80FF)),
                  ),
                  Text('${model.price!.toInt()} جنيه'),
                ],
              ),
              horizontalSpace(18),
              Expanded(child: AddToCart(model: model)),
            ],
          ),
        ],
      ),
    );
  }
}
