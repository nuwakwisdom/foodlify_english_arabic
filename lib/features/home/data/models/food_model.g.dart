// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) => FoodModel(
      food: CartFoodModel.fromJson(json['food'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      total_price: json['total_price'] as num?,
    );

Map<String, dynamic> _$FoodModelToJson(FoodModel instance) => <String, dynamic>{
      'food': instance.food,
      'quantity': instance.quantity,
      'total_price': instance.total_price,
    };
