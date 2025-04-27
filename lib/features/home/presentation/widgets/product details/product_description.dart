import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.model,
  });

  final ProductDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.name!,
            maxLines: 1,
            style: AppStyles.style20Medium,
            textAlign: TextAlign.start,
          ),
          verticalSpace(6),
          Text(
            'الوصف',
            style: AppStyles.style20SemiBold
                .copyWith(color: const Color(0xFF3F80FF)),
            textAlign: TextAlign.start,
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Text(
                  model.description!,
                  style: AppStyles.style14Medium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
