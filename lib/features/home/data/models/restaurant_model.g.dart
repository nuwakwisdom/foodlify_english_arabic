// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) =>
    RestaurantModel(
      name: json['name'] as String?,
      address: json['address'] as String?,
      logo: json['logo'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      registered: json['registered'] as bool?,
      location: json['location'] as String?,
      branch: json['branch'] as int?,
      open_time: json['open_time'] as String?,
      close_time: json['close_time'] as String?,
      status: json['status'] as String?,
      range_fund: json['range_fund'] as int?,
      restaurant_id: json['restaurant_id'] as String?,
      restaurant_person: (json['restaurant_person'] as List<dynamic>?)
          ?.map(
              (e) => RestaurantPersonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantModelToJson(RestaurantModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'logo': instance.logo,
      'email': instance.email,
      'website': instance.website,
      'registered': instance.registered,
      'location': instance.location,
      'branch': instance.branch,
      'open_time': instance.open_time,
      'close_time': instance.close_time,
      'status': instance.status,
      'range_fund': instance.range_fund,
      'restaurant_id': instance.restaurant_id,
      'restaurant_person': instance.restaurant_person,
    };
