import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/Favorites/presentation/logic/favorite_cubit.dart';
import 'package:marketi/features/Favorites/presentation/logic/favorite_state.dart';
import 'package:marketi/features/Favorites/presentation/widgets/item_favorite_product.dart';

class AllFavoritesProducts extends StatelessWidget {
  const AllFavoritesProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        var favoriteList = FavoriteCubit.get(context).favoriteList;
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.9,
          width: double.infinity,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: favoriteList!.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: ItemFavoriteProduct(
                favoriteitem: favoriteList[index],
              ),
            ),
            primary: true,
          ),
        );
      },
    );
  }
}
