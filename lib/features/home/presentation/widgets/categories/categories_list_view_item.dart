import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/features/home/data/models/categories_response_model.dart';
import 'package:marketi/features/home/presentation/Screens/category_products_screen.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesListViewItem extends StatelessWidget {
  const CategoriesListViewItem({super.key, required this.model});

  final CategoriesDataList model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryProductsScreen(
              id: model.id!,
              categoryName: model.name!,
            ),
          ),
        );
      },
      child: Container(
        width: 160.w,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 160.w,
              height: 140,
              child: CachedNetworkImage(
                imageUrl: model.image!,
                fit: BoxFit.cover,
                placeholder: (context, url) => imageLoading(),
                errorWidget: (context, url, error) => imageLoading(),
              ),
            ),
            Text(
              model.name!,
              style: AppStyles.style16SemiBold,
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
        width: 150,
        height: 130,
        color: Colors.white,
      ),
    );
  }
}
