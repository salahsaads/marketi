import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/features/Favorites/data/models/get_favorite_response_model.dart';
import 'package:marketi/features/Favorites/presentation/logic/favorite_cubit.dart';
import 'package:shimmer/shimmer.dart';

class ItemFavoriteProduct extends StatelessWidget {
  const ItemFavoriteProduct({super.key, required this.favoriteitem});

  final FavoriteDataList favoriteitem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
              imageUrl: favoriteitem.product!.image,
              fit: BoxFit.contain,
              placeholder: (context, url) => imageLoading(),
              errorWidget: (context, url, error) => imageLoading(),
            ),
          ),
          horizontalSpace(30),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favoriteitem.product!.name,
                  style: AppStyles.style16Medium,
                ),
                verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('السعر : ${favoriteitem.product!.price} جنيه'),
                    GestureDetector(
                      onTap: () {
                        FavoriteCubit.get(context)
                            .addProductFavorites(favoriteitem.product!.id);
                      },
                      child: const Icon(
                        Icons.favorite_outlined,
                        size: 35,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Shimmer imageLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 90,
        height: 190,
        color: Colors.white,
      ),
    );
  }
}
