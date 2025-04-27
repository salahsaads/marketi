import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';

import 'category_product_list_view_item.dart';

class CategoryProductListView extends StatelessWidget {
  const CategoryProductListView({super.key, required this.categoryProductList});
  final List<ProductDetailsModel> categoryProductList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: categoryProductList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: CategoryProductListViewItem(
            model: categoryProductList[index],
          ),
        ),
      ),
    );
  }
}
