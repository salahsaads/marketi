import 'package:json_annotation/json_annotation.dart';

part 'product_cart_response.g.dart';

@JsonSerializable()
class ProductCartResponse {
  final String name;
  final double price;
  final String photo;
  final double rate;
  final String description;

  ProductCartResponse({
    required this.name,
    required this.price,
    required this.photo,
    required this.rate,
    required this.description,
  });

  factory ProductCartResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCartResponseToJson(this);
}
