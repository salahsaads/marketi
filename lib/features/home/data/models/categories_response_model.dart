import 'package:json_annotation/json_annotation.dart';

part 'categories_response_model.g.dart';

@JsonSerializable(createToJson: false)
class CategoriesResponseModel {
  CategoriesResponseModel({
    required this.status,
    required this.data,
  });

  final bool? status;
  final Data? data;

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class Data {
  Data({
    required this.data,
  });

  final List<CategoriesDataList>? data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable(createToJson: false)
class CategoriesDataList {
  CategoriesDataList({
    required this.id,
    required this.name,
    required this.image,
  });

  final int? id;
  final String? name;
  final String? image;

  factory CategoriesDataList.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDataListFromJson(json);
}
