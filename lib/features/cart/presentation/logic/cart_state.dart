import 'package:marketi/features/cart/data/models/get_cart_response_model.dart';

abstract class CartState {}

final class CartInitialState extends CartState {}

final class GetCartLoadingState extends CartState {}

final class GetCartSuccessState extends CartState {
  final List<CartItem> cartItems;

  GetCartSuccessState({required this.cartItems});
}

final class GetCartErrorState extends CartState {
  final String message;

  GetCartErrorState({required this.message});
}

final class ChangeCartLoadingState extends CartState {}

final class ChangeCartSuccessState extends CartState {}

final class ChangeCartErrorState extends CartState {
  final String message;

  ChangeCartErrorState({required this.message});
}
