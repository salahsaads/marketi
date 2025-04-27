import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/di/dependency_injection.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/core/widgets/icon_navigate_pop.dart';
import 'package:marketi/features/Favorites/presentation/logic/favorite_cubit.dart';
import 'package:marketi/features/home/presentation/logic/home_cubit.dart';
import 'package:marketi/features/home/presentation/logic/home_state.dart';
import 'package:marketi/features/home/presentation/widgets/categories/category_product_bloc_builder.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen(
      {super.key, required this.id, required this.categoryName});

  final int id;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>()..getCategoryById(id),
        ),
        BlocProvider(
          create: (context) => getIt<FavoriteCubit>(),
        ),
      ],
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 30.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const IconNavigatePop(),
                          Text(
                            categoryName,
                            style: AppStyles.style20Medium,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/Cart_Icon_UIA.png',
                              height: 30,
                              width: 60,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      const CategoryProductBlocBuilder(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
