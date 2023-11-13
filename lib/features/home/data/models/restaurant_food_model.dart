// ignore_for_file: non_constant_identifier_names

import 'package:Foodlify/features/home/domain/entities/restaurant_food_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_food_model.g.dart';

@JsonSerializable()
class RestaurantFoodModel extends RestaurantFoodEntity {
  const RestaurantFoodModel({
    required super.food_id,
    required super.restaurant,
    required super.category,
    required super.title,
    required super.price,
    required super.description,
    required super.image,
  });
  factory RestaurantFoodModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantFoodModelToJson(this);
}
