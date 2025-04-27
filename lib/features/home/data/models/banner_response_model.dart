import 'package:json_annotation/json_annotation.dart';

part 'banner_response_model.g.dart';

@JsonSerializable(createToJson: false)
class BannerResponseModel {
  BannerResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final dynamic message;
  final List<DataBanner>? data;

  factory BannerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class DataBanner {
  DataBanner({
    required this.id,
    required this.image,
  });

  final int? id;
  final String? image;

  factory DataBanner.fromJson(Map<String, dynamic> json) =>
      _$DataBannerFromJson(json);
}
