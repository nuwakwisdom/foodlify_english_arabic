// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:Foodlify/features/home/data/models/cart_food_model.dart';

class FoodEntity extends Equatable {
  const FoodEntity({
    required this.food,
    this.quantity,
    this.total_price,
  });
  final CartFoodModel food;
  final int? quantity;
  final num? total_price;
  @override
  List<Object?> get props => [
        food,
        quantity,
        total_price,
      ];
}
