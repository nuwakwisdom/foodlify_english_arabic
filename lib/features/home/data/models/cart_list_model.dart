import 'package:json_annotation/json_annotation.dart';
import 'package:Foodlify/features/home/data/models/food_list_model.dart';
part 'cart_list_model.g.dart';

@JsonSerializable()
class CartListModel {
  const CartListModel({
    required this.body,
  });
  factory CartListModel.fromJson(Map<String, dynamic> json) =>
      _$CartListModelFromJson(json);

  final List<FoodListModel>? body;

  Map<String, dynamic> toJson() => _$CartListModelToJson(this);
}
