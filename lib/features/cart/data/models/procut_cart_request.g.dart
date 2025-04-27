// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procut_cart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCartRequest _$ProductCartRequestFromJson(Map<String, dynamic> json) =>
    ProductCartRequest(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      photo: json['photo'] as String,
      rate: (json['rate'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProductCartRequestToJson(ProductCartRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'photo': instance.photo,
      'rate': instance.rate,
      'description': instance.description,
    };
