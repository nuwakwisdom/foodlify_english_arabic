import 'package:json_annotation/json_annotation.dart';
import 'package:Foodlify/features/home/data/models/food_categories_model.dart';
part 'food_category_list.g.dart';

@JsonSerializable()
class FoodCategoriesListModel {
  const FoodCategoriesListModel({
    required this.body,
  });
  factory FoodCategoriesListModel.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoriesListModelFromJson(json);

  final List<FoodCategoriesModel>? body;

  Map<String, dynamic> toJson() => _$FoodCategoriesListModelToJson(this);
}
