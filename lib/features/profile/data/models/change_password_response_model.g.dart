// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordResponseModel _$ChangePasswordResponseModelFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordResponseModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataChangePassword.fromJson(json['data'] as Map<String, dynamic>),
    );

DataChangePassword _$DataChangePasswordFromJson(Map<String, dynamic> json) =>
    DataChangePassword(
      email: json['email'] as String?,
    );
