import 'package:json_annotation/json_annotation.dart';

part 'cart_response_model.g.dart';

@JsonSerializable(createToJson: false)
class CartResponseModel {
  CartResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class Data {
  Data({
    required this.id,
    required this.quantity,
    required this.product,
  });

  final int? id;
  final int? quantity;
  final Product? product;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
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
  });

  final int? id;
  final int? price;

  @JsonKey(name: 'old_price')
  final int? oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
