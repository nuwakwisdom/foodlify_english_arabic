import 'package:Foodlify/features/home/domain/entities/restaurant_food_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_food_state.freezed.dart';

@freezed
class SearchFoodState with _$SearchFoodState {
  const factory SearchFoodState.initial() = _$Initial;

  const factory SearchFoodState.loading() = _$Loading;

  const factory SearchFoodState.error({
    required String message,
  }) = _$Error;

  const factory SearchFoodState.foods({
    required List<RestaurantFoodEntity> foods,
  }) = _$Foods;
}
