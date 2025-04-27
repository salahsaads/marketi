import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/features/home/presentation/widgets/search_bar.dart';
import 'package:marketi/features/home/presentation/logic/home_cubit.dart';
import 'package:marketi/features/home/presentation/logic/home_state.dart';
import 'package:marketi/features/home/presentation/widgets/banners/banner_bloc_builder.dart';
import 'package:marketi/features/home/presentation/widgets/appbar_home.dart';
import 'package:marketi/features/home/presentation/widgets/categories/categories_bloc_builder.dart';
import 'package:marketi/features/home/presentation/widgets/products/products_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14.w),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: AppBarHome()),
                  const SliverToBoxAdapter(child: AppSearchBar()),
                  const SliverToBoxAdapter(child: BannerBlocBuilder()),
                  SliverToBoxAdapter(child: verticalSpace(12)),
                  const SliverToBoxAdapter(child: CategoriesBlocBuilder()),
                  SliverToBoxAdapter(child: verticalSpace(30)),
                  const SliverToBoxAdapter(child: ProductsBlocBuilder()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
