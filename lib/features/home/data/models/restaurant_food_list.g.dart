// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_food_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantModelList _$RestaurantModelListFromJson(Map<String, dynamic> json) =>
    RestaurantModelList(
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => RestaurantFoodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantModelListToJson(
        RestaurantModelList instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
