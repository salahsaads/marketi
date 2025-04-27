import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marketi/features/home/data/models/banner_response_model.dart';
import 'package:marketi/features/home/presentation/widgets/banners/banner_shimmer_loading.dart';

class BannersListViewItem extends StatelessWidget {
  const BannersListViewItem({super.key, required this.model});

  final DataBanner? model;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: model!.image!,
      fit: BoxFit.cover,
      placeholder: (context, url) => const BannerShimmerLoading(),
    );
  }
}
