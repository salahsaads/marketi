import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/features/cart/data/models/get_cart_response_model.dart';
import 'package:marketi/features/cart/presentation/logic/cart_cubit.dart';

class ChangeProductQuantity extends StatelessWidget {
  const ChangeProductQuantity({
    super.key,
    required this.model,
  });

  final CartItem model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: ShapeDecoration(
            color: const Color(0xFFD9E6FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
            ),
          ),
          child: const Center(child: Icon(Icons.add)),
        ),
        Container(
          width: 90,
          height: 40,
          decoration: ShapeDecoration(
            color: const Color(0xFFD9E6FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
            ),
          ),
          child: Center(
            child: Text('${model.quantity!}', style: AppStyles.style16SemiBold),
          ),
        ),
        GestureDetector(
          onTap: () {
            CartCubit.get(context).addProductCarts(model.product!.id!);
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0xFFD9E6FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
            child: Center(
              child: model.quantity! == 1
                  ? const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )
                  : const Text(
                      '--',
                      style: TextStyle(
                        wordSpacing: 0,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
