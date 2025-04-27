import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';
import 'package:marketi/features/home/presentation/widgets/products/all_product_grid_view_item.dart';

class AllProductsGridView extends StatelessWidget {
  const AllProductsGridView({super.key, required this.allProductList});

  final List<ProductDetailsModel>? allProductList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: allProductList!.length,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 164.w / 260.h,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.w,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) => AllProductGridViewItem(
        model: allProductList![index],
      ),
    );
  }
}
