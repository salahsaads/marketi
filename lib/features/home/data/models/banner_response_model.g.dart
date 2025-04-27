// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponseModel _$BannerResponseModelFromJson(Map<String, dynamic> json) =>
    BannerResponseModel(
      status: json['status'] as bool?,
      message: json['message'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataBanner.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

DataBanner _$DataBannerFromJson(Map<String, dynamic> json) => DataBanner(
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
    );
