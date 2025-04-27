import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/networking/api_result.dart';
import 'package:marketi/features/cart/data/models/cart_request_model.dart';
import 'package:marketi/features/cart/data/models/cart_response_model.dart';
import 'package:marketi/features/cart/data/models/get_cart_response_model.dart';
import 'package:marketi/features/cart/data/repository/cart_repository.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository _cartRepository;
  CartCubit(this._cartRepository) : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);

  List<CartItem>? cartListItems = [];
  int? myCartTotal = 0;
  GetCartResponseModel? getCartResponseModel;

  void getCarts() async {
    emit(GetCartLoadingState());

    final response = await _cartRepository.getCartProducts();

    if (response is Success<GetCartResponseModel>) {
      getCartResponseModel = response.data;
      cartListItems = response.data.data!.cartItems;
      myCartTotal = response.data.data!.total;
      emit(GetCartSuccessState(cartItems: cartListItems!));
    } else {
      emit(GetCartErrorState(message: 'Not found products'));
    }
  }

  void addProductCarts(int id) async {
    emit(GetCartLoadingState());

    final response =
        await _cartRepository.addProductCart(CartRequestModel(productId: id));

    if (response is Success<CartResponseModel>) {
      getCarts();

      emit(ChangeCartSuccessState());
    } else {
      emit(GetCartErrorState(message: 'Not found products'));
    }
  }
}
