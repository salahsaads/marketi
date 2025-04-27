import 'package:flutter/material.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:shimmer/shimmer.dart';

class CategoryProductShimmerLoading extends StatelessWidget {
  const CategoryProductShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context, index) {
            return const CategoriesShimmerLoadingItem();
          },
        ),
      ),
    );
  }
}

class CategoriesShimmerLoadingItem extends StatelessWidget {
  const CategoriesShimmerLoadingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 150,
              height: 130,
              color: Colors.white,
            ),
          ),
          horizontalSpace(14),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 25,
                  width: double.maxFinite,
                  color: Colors.white,
                ),
                verticalSpace(20),
                Container(
                  height: 10,
                  width: double.maxFinite,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
