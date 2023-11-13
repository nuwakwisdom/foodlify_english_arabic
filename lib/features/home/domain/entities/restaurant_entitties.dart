// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:Foodlify/features/home/data/models/restaurant_person_model.dart';

class RestaurantEntity extends Equatable {
  const RestaurantEntity({
    this.location,
    this.open_time,
    this.close_time,
    this.name,
    this.address,
    this.logo,
    this.email,
    this.website,
    this.registered,
    this.branch,
    this.status,
    this.range_fund,
    this.restaurant_id,
    this.restaurant_person,
  });

  final String? name;
  final String? address;
  final String? logo;
  final String? email;
  final String? website;
  final bool? registered;
  final String? location;
  final int? branch;
  final String? open_time;
  final String? close_time;
  final String? status;
  final int? range_fund;
  final String? restaurant_id;
  final List<RestaurantPersonModel>? restaurant_person;
  @override
  List<Object?> get props => [
        name,
        address,
        location,
        email,
        website,
        registered,
        location,
        branch,
        open_time,
        close_time,
        status,
        range_fund,
        restaurant_id,
        restaurant_person
      ];
}
