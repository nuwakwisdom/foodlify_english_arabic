// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartFoodModel _$CartFoodModelFromJson(Map<String, dynamic> json) =>
    CartFoodModel(
      food_id: json['food_id'] as String,
      restaurant: json['restaurant'] as String,
      category: json['category'] as String,
      title: json['title'] as String,
      price: json['price'] as num?,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CartFoodModelToJson(CartFoodModel instance) =>
    <String, dynamic>{
      'food_id': instance.food_id,
      'restaurant': instance.restaurant,
      'category': instance.category,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'image': instance.image,
    };
