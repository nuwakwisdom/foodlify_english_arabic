// ignore_for_file: non_constant_identifier_names

import 'package:Foodlify/features/account/data/models/delivery_address_model.dart';
import 'package:Foodlify/features/home/data/models/restaurant_food_model.dart';
import 'package:Foodlify/features/home/domain/entities/orders_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends OrdersEntity {
  const OrderModel({
    required super.food,
    required super.delivery_address,
    required super.status,
    required super.order_at,
    required super.order_id,
    required super.delivery_type,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
