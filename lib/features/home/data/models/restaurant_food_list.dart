import 'package:json_annotation/json_annotation.dart';
import 'package:Foodlify/features/home/data/models/restaurant_food_model.dart';
part 'restaurant_food_list.g.dart';

@JsonSerializable()
class RestaurantModelList {
  RestaurantModelList({required this.body});

  factory RestaurantModelList.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelListFromJson(json);

  final List<RestaurantFoodModel>? body;

  Map<String, dynamic> toJson() => _$RestaurantModelListToJson(this);
}
