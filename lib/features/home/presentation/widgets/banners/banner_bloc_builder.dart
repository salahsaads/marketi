import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/data/models/banner_response_model.dart';
import 'package:marketi/features/home/presentation/logic/home_cubit.dart';
import 'package:marketi/features/home/presentation/logic/home_state.dart';
import 'package:marketi/features/home/presentation/widgets/banners/banner_shimmer_loading.dart';
import 'package:marketi/features/home/presentation/widgets/banners/banners_list_view.dart';

class BannerBlocBuilder extends StatelessWidget {
  const BannerBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeBannerLoadingState ||
          current is HomeBannerSuccessState ||
          current is HomeBannerErrorState,
      builder: (context, state) {
        var bannersList = HomeCubit.get(context).bannerList;
        switch (state) {
          case HomeBannerLoadingState _:
            return const BannerShimmerLoading();

          case HomeBannerSuccessState _:
            return setupSuccess(bannersList);

          case HomeBannerErrorState _:
            return const SizedBox.shrink();

          default:
            return setupSuccess(bannersList);
        }
      },
    );
  }

  BannersListView setupSuccess(List<DataBanner>? bannersList) {
    return BannersListView(bannersList: bannersList);
  }
}
