// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersListModel _$OrdersListModelFromJson(Map<String, dynamic> json) =>
    OrdersListModel(
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdersListModelToJson(OrdersListModel instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
