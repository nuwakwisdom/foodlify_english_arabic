// ignore_for_file: non_constant_identifier_names

import 'package:Foodlify/features/home/data/models/restaurant_person_model.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_entitties.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_model.g.dart';

@JsonSerializable()
class RestaurantModel extends RestaurantEntity {
  const RestaurantModel({
    super.name,
    super.address,
    super.logo,
    super.email,
    super.website,
    super.registered,
    super.location,
    super.branch,
    super.open_time,
    super.close_time,
    super.status,
    super.range_fund,
    super.restaurant_id,
    super.restaurant_person,
  });
  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);
}
