import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/features/Favorites/presentation/logic/favorite_cubit.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';
import 'package:marketi/features/home/presentation/Screens/product_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class CategoryProductListViewItem extends StatelessWidget {
  const CategoryProductListViewItem({
    super.key,
    required this.model,
  });

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
        width: double.infinity,
        height: 220.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: model.image!,
                fit: BoxFit.cover,
                placeholder: (context, url) => imageLoading(),
                errorWidget: (context, url, error) => imageLoading(),
              ),
            ),
            horizontalSpace(12),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(model.name!, style: AppStyles.style16Medium),
                  verticalSpace(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('السعر : ${model.price} جنيه'),
                      IconButton(
                        onPressed: () {
                          FavoriteCubit.get(context)
                              .addProductFavorites(model.id!);
                        },
                        icon: model.inFavorites! == true
                            ? const Icon(Icons.favorite_outlined,
                                color: Colors.red, size: 30)
                            : const Icon(Icons.favorite_border, size: 30),
                      ),
                    ],
                  ),
                ],
              ),
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
        width: 90,
        height: 190,
        color: Colors.white,
      ),
    );
  }
}
