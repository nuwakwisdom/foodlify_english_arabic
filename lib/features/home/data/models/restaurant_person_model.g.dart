// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantPersonModel _$RestaurantPersonModelFromJson(
        Map<String, dynamic> json) =>
    RestaurantPersonModel(
      surnname: json['surnname'] as String?,
      email: json['email'] as String?,
      first_name: json['first_name'] as String?,
      phone_number: json['phone_number'] as String?,
      identity_type: json['identity_type'] as String?,
      identity_file_url: json['identity_file_url'] as String?,
    );

Map<String, dynamic> _$RestaurantPersonModelToJson(
        RestaurantPersonModel instance) =>
    <String, dynamic>{
      'surnname': instance.surnname,
      'email': instance.email,
      'first_name': instance.first_name,
      'phone_number': instance.phone_number,
      'identity_type': instance.identity_type,
      'identity_file_url': instance.identity_file_url,
    };
