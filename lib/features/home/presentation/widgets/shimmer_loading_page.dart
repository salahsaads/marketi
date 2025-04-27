import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingPage extends StatelessWidget {
  const ShimmerLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // Top bar shimmer
              const SizedBox(height: 20),
              _buildTopBarShimmer(),
              const SizedBox(height: 20),
              // Ad banner shimmer
              _buildBannerShimmer(),
              const SizedBox(height: 40),
              // Category list shimmer
              _buildCategoryListShimmer(),
              const SizedBox(height: 20),
              // Product list shimmer
              _buildProductListShimmer(),
            ],
          ),
        ),
      ),
    );
  }

  // Shimmer for the top bar (profile, search, etc.)
  Widget _buildTopBarShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
        child: Row(
          children: [
            const CircleAvatar(radius: 30, backgroundColor: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 40,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Shimmer for the ad banner
  Widget _buildBannerShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        color: Colors.white,
      ),
    );
  }

  // Shimmer for the category list
  Widget _buildCategoryListShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
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
          },
        ),
      ),
    );
  }

  // Shimmer for the product list
  Widget _buildProductListShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white,
            height: 200,
            width: double.infinity,
          );
        },
      ),
    );
  }
}
