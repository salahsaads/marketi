import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/features/cart/data/models/get_cart_response_model.dart';
import 'package:marketi/features/cart/presentation/widgets/price_and_favorite_icon.dart';

import 'change_product_quantity.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({super.key, required this.model});

  final CartItem model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xB2B2CCFF),
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 190,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.network(
                    model.product!.image!,
                    height: 150,
                  ),
                ),
                horizontalSpace(8),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.product!.name!,
                        maxLines: 2,
                        style: AppStyles.style16SemiBold,
                      ),
                      PriceAndFavoriteIcon(model: model),
                      ChangeProductQuantity(model: model),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
