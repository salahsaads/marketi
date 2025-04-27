import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/data/models/categories_response_model.dart';
import 'package:marketi/features/home/presentation/logic/home_cubit.dart';
import 'package:marketi/features/home/presentation/logic/home_state.dart';
import 'package:marketi/features/home/presentation/widgets/categories/categories_list_view.dart';
import 'package:marketi/features/home/presentation/widgets/categories/categories_shimmer_loading.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeCategoriesLoadingState ||
          current is HomeCategoriesSuccessState ||
          current is HomeCategoriesErrorState,
      builder: (context, state) {
        var categoriesList = HomeCubit.get(context).categoriesList;
        switch (state) {
          case HomeCategoriesLoadingState _:
            return const CategoriesShimmerLoading();

          case HomeCategoriesSuccessState _:
            return setupSuccess(categoriesList);

          case HomeCategoriesErrorState _:
            return const SizedBox.shrink();

          default:
            return setupSuccess(categoriesList);
        }
      },
    );
  }

  CategoriesListView setupSuccess(List<CategoriesDataList>? categoriesList) {
    return CategoriesListView(
      categoriesList: categoriesList,
    );
  }
}
