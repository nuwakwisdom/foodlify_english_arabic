// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartListModel _$CartListModelFromJson(Map<String, dynamic> json) =>
    CartListModel(
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => FoodListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartListModelToJson(CartListModel instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
