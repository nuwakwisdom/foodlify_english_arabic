import 'package:json_annotation/json_annotation.dart';
import 'package:Foodlify/features/home/data/models/food_model.dart';
import 'package:Foodlify/features/home/domain/entities/food_list_entities.dart';
part 'food_list_model.g.dart';

@JsonSerializable()
class FoodListModel extends FoodListEnntities {
  FoodListModel({
    required super.id,
    required super.cartFoods,
    required super.status,
  });
  factory FoodListModel.fromJson(Map<String, dynamic> json) =>
      _$FoodListModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodListModelToJson(this);
}
