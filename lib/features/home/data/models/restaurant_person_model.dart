// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_person_entity.dart';
part 'restaurant_person_model.g.dart';

@JsonSerializable()
class RestaurantPersonModel extends RestauranttPersonEntity {
  const RestaurantPersonModel({
    super.surnname,
    super.email,
    super.first_name,
    super.phone_number,
    super.identity_type,
    super.identity_file_url,
  });
  factory RestaurantPersonModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantPersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantPersonModelToJson(this);
}
