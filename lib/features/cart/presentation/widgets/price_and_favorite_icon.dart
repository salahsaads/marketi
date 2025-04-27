import 'package:flutter/material.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/features/Favorites/presentation/logic/favorite_cubit.dart';
import 'package:marketi/features/cart/data/models/get_cart_response_model.dart';
import 'package:marketi/features/cart/presentation/logic/cart_cubit.dart';

class PriceAndFavoriteIcon extends StatelessWidget {
  const PriceAndFavoriteIcon({
    super.key,
    required this.model,
  });

  final CartItem model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'السعر: ${model.product!.price!} جنيه',
          style: AppStyles.style16SemiBold,
        ),
        if (model.product!.inFavorites == true)
          GestureDetector(
            onTap: () {
              FavoriteCubit.get(context)
                  .addProductFavorites(model.product!.id!);
              CartCubit.get(context).getCarts();
            },
            child: const Icon(
              Icons.favorite_outlined,
              color: Colors.red,
              size: 30,
            ),
          )
        else
          GestureDetector(
            onTap: () {
              FavoriteCubit.get(context)
                  .addProductFavorites(model.product!.id!);
              CartCubit.get(context).getCarts();
            },
            child: const Icon(
              Icons.favorite_border_outlined,
              size: 30,
            ),
          ),
      ],
    );
  }
}
