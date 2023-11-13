// ignore_for_file: non_constant_identifier_names

import 'package:Foodlify/features/account/data/models/delivery_address_model.dart';
import 'package:Foodlify/features/home/data/models/restaurant_food_model.dart';
import 'package:equatable/equatable.dart';

class OrdersEntity extends Equatable {
  const OrdersEntity({
    required this.food,
    required this.delivery_address,
    required this.status,
    required this.order_at,
    required this.order_id,
    required this.delivery_type,
  });
  final RestaurantFoodModel food;
  final DeliveryAddressModel delivery_address;
  final String status;
  final String order_at;
  final String order_id;
  final String delivery_type;

  @override
  List<Object?> get props => [
        food,
        delivery_address,
        status,
        order_at,
        order_id,
        delivery_address,
      ];
}
