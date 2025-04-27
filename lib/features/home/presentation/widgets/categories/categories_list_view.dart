import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/features/home/data/models/categories_response_model.dart';
import 'package:marketi/features/home/presentation/widgets/categories/categories_list_view_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key, this.categoriesList});

  final List<CategoriesDataList>? categoriesList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('الفئات', style: AppStyles.style20SemiBold),
        verticalSpace(10),
        SizedBox(
          height: 180.h,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categoriesList!.length,
            itemBuilder: (context, index) => CategoriesListViewItem(
              model: categoriesList![index],
            ),
            separatorBuilder: (BuildContext context, int index) =>
                horizontalSpace(16),
          ),
        ),
      ],
    );
  }
}
