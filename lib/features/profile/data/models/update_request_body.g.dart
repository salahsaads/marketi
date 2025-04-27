// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRequestBody _$UpdateRequestBodyFromJson(Map<String, dynamic> json) =>
    UpdateRequestBody(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$UpdateRequestBodyToJson(UpdateRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'image': instance.image,
    };
