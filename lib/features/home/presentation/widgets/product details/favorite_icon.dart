import 'package:flutter/material.dart';
import 'package:marketi/features/Favorites/presentation/logic/favorite_cubit.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    required this.model,
  });

  final ProductDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FavoriteCubit.get(context).addProductFavorites(model.id!);
      },
      child: model.inFavorites! == true
          ? const Icon(Icons.favorite_outlined, color: Colors.red, size: 30)
          : const Icon(Icons.favorite_border, size: 30),
    );
  }
}
