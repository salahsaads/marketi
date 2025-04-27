// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutResponseModel _$LogoutResponseModelFromJson(Map<String, dynamic> json) =>
    LogoutResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : LogoutData.fromJson(json['data'] as Map<String, dynamic>),
    );

LogoutData _$LogoutDataFromJson(Map<String, dynamic> json) => LogoutData(
      id: (json['id'] as num).toInt(),
      token: json['token'] as String,
    );
