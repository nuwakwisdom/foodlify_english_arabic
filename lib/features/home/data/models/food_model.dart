// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:Foodlify/features/home/data/models/cart_food_model.dart';
import 'package:Foodlify/features/home/domain/entities/food_entity.dart';
part 'food_model.g.dart';

@JsonSerializable()
class FoodModel extends FoodEntity {
  const FoodModel({
    required super.food,
    super.quantity,
    super.total_price,
  });
  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodModelToJson(this);
}
