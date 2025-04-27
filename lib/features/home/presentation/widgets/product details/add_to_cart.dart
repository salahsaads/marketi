import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/features/cart/presentation/logic/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/logic/cart_state.dart';
import 'package:marketi/features/home/data/models/product_response_model.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.model});

  final ProductDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            CartCubit.get(context).addProductCarts(model.id!);
          },
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF3F80FF)),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Cart_Icon_UIA.png',
                ),
                horizontalSpace(14),
                Text(
                  'اضافة إلي السلة',
                  style: AppStyles.style20SemiBold.copyWith(
                    color: const Color(0xFF3F80FF),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
