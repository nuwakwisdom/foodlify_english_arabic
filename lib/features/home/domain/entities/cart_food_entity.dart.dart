// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class CartFoodEntity extends Equatable {
  const CartFoodEntity({
    required this.food_id,
    required this.restaurant,
    required this.category,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  final String food_id;
  final String restaurant;
  final String category;
  final String title;
  final num? price;
  final String description;
  final String image;

  @override
  List<Object?> get props => [
        food_id,
        restaurant,
        category,
        title,
        price,
        description,
        image,
      ];
}
