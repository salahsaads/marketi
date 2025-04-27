import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';
import 'package:marketi/features/home/presentation/logic/home_cubit.dart';
import 'package:marketi/features/home/presentation/logic/home_state.dart';

import 'category_product_list_view.dart';
import 'category_product_shimmer_loading.dart';

class CategoryProductBlocBuilder extends StatelessWidget {
  const CategoryProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeCategoryByIdLoadingState ||
          current is HomeCategoryByIdSuccessState ||
          current is HomeCategoryByIdErrorState,
      builder: (context, state) {
        var categoryProductsList = HomeCubit.get(context).categoryProductsList;

        switch (state) {
          case HomeCategoryByIdLoadingState _:
            return const CategoryProductShimmerLoading();
          case HomeCategoryByIdSuccessState _:
            return setupSuccess(categoryProductsList);
          case HomeCategoryByIdErrorState _:
            return const CategoryProductShimmerLoading();
          default:
            return setupSuccess(categoryProductsList);
        }
      },
    );
  }

  setupSuccess(List<ProductDetailsModel>? categoryProductList) {
    return CategoryProductListView(
      categoryProductList: categoryProductList!,
    );
  }
}
