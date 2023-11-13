// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      food: RestaurantFoodModel.fromJson(json['food'] as Map<String, dynamic>),
      delivery_address: DeliveryAddressModel.fromJson(
          json['delivery_address'] as Map<String, dynamic>),
      status: json['status'] as String,
      order_at: json['order_at'] as String,
      order_id: json['order_id'] as String,
      delivery_type: json['delivery_type'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'food': instance.food,
      'delivery_address': instance.delivery_address,
      'status': instance.status,
      'order_at': instance.order_at,
      'order_id': instance.order_id,
      'delivery_type': instance.delivery_type,
    };
