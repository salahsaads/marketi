import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesShimmerLoading extends StatelessWidget {
  const CategoriesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
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
      child: Column(
        children: [
          Container(
            width: 150,
            height: 130,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Container(
            height: 10,
            width: 100,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
