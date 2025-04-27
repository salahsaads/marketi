import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/features/cart/presentation/logic/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/logic/cart_state.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_list_view_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cartList = CartCubit.get(context).cartListItems;
        return Expanded(
          child: SizedBox(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: cartList!.length,
              separatorBuilder: (context, index) => verticalSpace(7),
              itemBuilder: (context, index) =>
                  CartListViewItem(model: cartList[index]),
            ),
          ),
        );
      },
    );
  }
}
