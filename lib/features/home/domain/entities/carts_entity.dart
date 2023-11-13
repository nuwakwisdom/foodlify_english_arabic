// ignore_for_file: non_constant_identifier_names

import 'package:Foodlify/features/home/data/models/food_model.dart';
import 'package:equatable/equatable.dart';

class NewCartEntity extends Equatable {
  const NewCartEntity({
    required this.cart_id,
    required this.cart_foods,
    required this.status,
    required this.delivery,
    required this.total_food_price,
    required this.total_cart_price,
  });
  final String cart_id;
  final List<FoodModel> cart_foods;
  final String status;
  final num delivery;
  final num total_food_price;
  final num total_cart_price;

  @override
  List<Object?> get props => [
        cart_id,
        cart_foods,
        status,
        total_cart_price,
      ];
}
