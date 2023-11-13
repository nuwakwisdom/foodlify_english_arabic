// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:Foodlify/features/home/domain/entities/food_category_entity.dart';
part 'food_categories_model.g.dart';

@JsonSerializable()
class FoodCategoriesModel extends FoodCategoryEntity {
  const FoodCategoriesModel({
    required super.category_name,
    super.restaurant_name,
  });
  factory FoodCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodCategoriesModelToJson(this);
}
