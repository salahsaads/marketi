// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCartResponse _$ProductCartResponseFromJson(Map<String, dynamic> json) =>
    ProductCartResponse(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      photo: json['photo'] as String,
      rate: (json['rate'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProductCartResponseToJson(
        ProductCartResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'photo': instance.photo,
      'rate': instance.rate,
      'description': instance.description,
    };
