import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/Favorites/presentation/widgets/all_favorites_products.dart';

class FaviorteScreen extends StatelessWidget {
  const FaviorteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 14.w),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AllFavoritesProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
