import 'package:json_annotation/json_annotation.dart';

part 'procut_cart_request.g.dart';

@JsonSerializable()
class ProductCartRequest {
  final String name;
  final double price;
  final String photo;
  final double rate;
  final String description;

  ProductCartRequest({
    required this.name,
    required this.price,
    required this.photo,
    required this.rate,
    required this.description,
  });

  factory ProductCartRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductCartRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCartRequestToJson(this);
}
