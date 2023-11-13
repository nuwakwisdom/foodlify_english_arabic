// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_category_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodCategoriesListModel _$FoodCategoriesListModelFromJson(
        Map<String, dynamic> json) =>
    FoodCategoriesListModel(
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => FoodCategoriesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoodCategoriesListModelToJson(
        FoodCategoriesListModel instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
