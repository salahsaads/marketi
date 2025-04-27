import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';
import 'package:marketi/features/home/presentation/logic/home_cubit.dart';
import 'package:marketi/features/home/presentation/logic/home_state.dart';
import 'package:marketi/features/home/presentation/widgets/products/all_products_grid_view.dart';
import 'package:marketi/features/home/presentation/widgets/products/shimmer_loading_grid_view.dart';

class ProductsBlocBuilder extends StatelessWidget {
  const ProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeAllProductsLoadingState ||
          current is HomeAllProductsSuccessState ||
          current is HomeAllProductsErrorState,
      builder: (context, state) {
        var allProductsList = HomeCubit.get(context).allProductsList;
        switch (state) {
          case HomeAllProductsLoadingState _:
            return const ShimmerLoadingGridView();

          case HomeAllProductsSuccessState _:
            return setupSuccess(allProductsList);

          case HomeAllProductsErrorState _:
            return const SizedBox.shrink();

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  setupLoading() {}

  setupSuccess(List<ProductDetailsModel>? allProductList) {
    return AllProductsGridView(allProductList: allProductList);
  }
}
