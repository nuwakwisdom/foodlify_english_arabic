// ignore_for_file: non_constant_identifier_names

import 'package:Foodlify/features/home/data/models/food_model.dart';
import 'package:Foodlify/features/home/domain/entities/carts_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_cart_model.g.dart';

@JsonSerializable()
class NewCartModel extends NewCartEntity {
  const NewCartModel({
    required super.cart_id,
    required super.cart_foods,
    required super.status,
    required super.total_cart_price,
    required super.delivery,
    required super.total_food_price,
  });
  factory NewCartModel.fromJson(Map<String, dynamic> json) =>
      _$NewCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewCartModelToJson(this);
}
