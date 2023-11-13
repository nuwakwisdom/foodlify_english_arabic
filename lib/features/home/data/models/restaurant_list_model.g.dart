// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantList _$RestaurantListFromJson(Map<String, dynamic> json) =>
    RestaurantList(
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => RestaurantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantListToJson(RestaurantList instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
