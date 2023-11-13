// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodListModel _$FoodListModelFromJson(Map<String, dynamic> json) =>
    FoodListModel(
      id: json['id'] as int,
      cartFoods: (json['cartFoods'] as List<dynamic>)
          .map((e) => FoodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$FoodListModelToJson(FoodListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cartFoods': instance.cartFoods,
      'status': instance.status,
    };
