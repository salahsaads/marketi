import 'package:json_annotation/json_annotation.dart';

part 'get_cart_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GetCartResponseModel {
  GetCartResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final dynamic message;
  final Data? data;

  factory GetCartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetCartResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class Data {
  Data({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  @JsonKey(name: 'cart_items')
  final List<CartItem>? cartItems;

  @JsonKey(name: 'sub_total')
  final int? subTotal;
  final int? total;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable(createToJson: false)
class CartItem {
  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  final int? id;
  final int? quantity;
  final Product? product;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

@JsonSerializable(createToJson: false)
class Product {
  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  final int? id;
  final int? price;

  @JsonKey(name: 'old_price')
  final int? oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;
  final List<String>? images;

  @JsonKey(name: 'in_favorites')
  final bool? inFavorites;

  @JsonKey(name: 'in_cart')
  final bool? inCart;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
