// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewCartModel _$NewCartModelFromJson(Map<String, dynamic> json) => NewCartModel(
      cart_id: json['cart_id'] as String,
      cart_foods: (json['cart_foods'] as List<dynamic>)
          .map((e) => FoodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      total_cart_price: json['total_cart_price'] as num,
      delivery: json['delivery'] as num,
      total_food_price: json['total_food_price'] as num,
    );

Map<String, dynamic> _$NewCartModelToJson(NewCartModel instance) =>
    <String, dynamic>{
      'cart_id': instance.cart_id,
      'cart_foods': instance.cart_foods,
      'status': instance.status,
      'delivery': instance.delivery,
      'total_food_price': instance.total_food_price,
      'total_cart_price': instance.total_cart_price,
    };
