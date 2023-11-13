// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodCategoriesModel _$FoodCategoriesModelFromJson(Map<String, dynamic> json) =>
    FoodCategoriesModel(
      category_name: json['category_name'] as String,
      restaurant_name: json['restaurant_name'] as String?,
    );

Map<String, dynamic> _$FoodCategoriesModelToJson(
        FoodCategoriesModel instance) =>
    <String, dynamic>{
      'category_name': instance.category_name,
      'restaurant_name': instance.restaurant_name,
    };
