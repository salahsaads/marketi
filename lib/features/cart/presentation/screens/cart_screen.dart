import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_list_view.dart';
import 'package:marketi/features/cart/presentation/widgets/checkout_cart_widget.dart';
import 'package:marketi/features/cart/presentation/widgets/total_price_and_product_number.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CartListView(),
                verticalSpace(14),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: const Column(
                    children: [
                      TotalPriceAndProductNumber(),
                      CheckoutCartWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
