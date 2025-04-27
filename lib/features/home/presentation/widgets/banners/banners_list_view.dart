import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/home/data/models/banner_response_model.dart';
import 'package:marketi/features/home/presentation/widgets/banners/banner_shimmer_loading.dart';
import 'package:marketi/features/home/presentation/widgets/banners/banners_list_view_item.dart';

class BannersListView extends StatelessWidget {
  const BannersListView({super.key, required this.bannersList});

  final List<DataBanner>? bannersList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: bannersList?.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            bannersList!.isEmpty
                ? const BannerShimmerLoading()
                : BannersListViewItem(model: bannersList![itemIndex]),
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
        ),
      ),
    );
  }
}
