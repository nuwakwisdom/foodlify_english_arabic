import 'package:json_annotation/json_annotation.dart';
import 'package:Foodlify/features/home/data/models/restaurant_model.dart';
part 'restaurant_list_model.g.dart';

@JsonSerializable()
class RestaurantList {
  RestaurantList({
    required this.body,
  });
  factory RestaurantList.fromJson(Map<String, dynamic> json) =>
      _$RestaurantListFromJson(json);

  final List<RestaurantModel>? body;

  Map<String, dynamic> toJson() => _$RestaurantListToJson(this);
}
