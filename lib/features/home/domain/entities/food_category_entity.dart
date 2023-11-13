// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class FoodCategoryEntity extends Equatable {
  const FoodCategoryEntity({
    required this.category_name,
    this.restaurant_name,
  });
  final String category_name;
  final String? restaurant_name;
  @override
  List<Object?> get props => [
        category_name,
        restaurant_name,
      ];
}
