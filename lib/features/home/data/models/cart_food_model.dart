// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:Foodlify/features/home/domain/entities/cart_food_entity.dart.dart';
part 'cart_food_model.g.dart';

@JsonSerializable()
class CartFoodModel extends CartFoodEntity {
  const CartFoodModel({
    required super.food_id,
    required super.restaurant,
    required super.category,
    required super.title,
    super.price,
    required super.description,
    required super.image,
  });

  factory CartFoodModel.fromJson(Map<String, dynamic> json) =>
      _$CartFoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartFoodModelToJson(this);
}
