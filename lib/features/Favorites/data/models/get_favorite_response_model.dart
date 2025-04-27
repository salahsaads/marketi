import 'package:json_annotation/json_annotation.dart';

part 'get_favorite_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GetFavoriteResponseModel {
  GetFavoriteResponseModel({
    required this.status,
    required this.data,
  });

  final bool status;
  final Data? data;

  factory GetFavoriteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetFavoriteResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class Data {
  Data({
    required this.currentPage,
    required this.data,
  });

  @JsonKey(name: 'current_page')
  final int currentPage;
  final List<FavoriteDataList>? data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable(createToJson: false)
class FavoriteDataList {
  FavoriteDataList({
    required this.id,
    required this.product,
  });

  final int id;
  final Product? product;

  factory FavoriteDataList.fromJson(Map<String, dynamic> json) =>
      _$FavoriteDataListFromJson(json);
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

  final int id;
  final int price;

  @JsonKey(name: 'old_price')
  final int oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
