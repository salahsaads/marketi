import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/features/Favorites/presentation/logic/favorite_cubit.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';
import 'package:marketi/features/home/presentation/Screens/product_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class AllProductGridViewItem extends StatelessWidget {
  const AllProductGridViewItem({super.key, required this.model});

  final ProductDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ProductDetailsScreen(model: model);
          },
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: model.image!,
                  fadeInDuration: const Duration(milliseconds: 500),
                  placeholder: (context, url) => imageLoading(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            verticalSpace(8),
            Text('${model.name}', maxLines: 2, style: AppStyles.style14Medium),
            verticalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${model.price} جنيه', style: AppStyles.style14Medium),
                GestureDetector(
                  onTap: () {
                    FavoriteCubit.get(context).addProductFavorites(model.id!);
                  },
                  child: model.inFavorites == true
                      ? const Icon(Icons.favorite_outlined,
                          color: Colors.red, size: 30)
                      : const Icon(Icons.favorite_border, size: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Shimmer imageLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        color: Colors.white,
        height: 200,
        width: double.infinity,
      ),
    );
  }
}
