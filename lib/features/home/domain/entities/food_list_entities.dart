import 'package:equatable/equatable.dart';
import 'package:Foodlify/features/home/data/models/food_model.dart';

class FoodListEnntities extends Equatable {
  FoodListEnntities({
    required this.id,
    required this.cartFoods,
    required this.status,
  });
  final int id;
  final List<FoodModel> cartFoods;
  final String status;

  @override
  List<Object?> get props => [
        cartFoods,
      ];
}
