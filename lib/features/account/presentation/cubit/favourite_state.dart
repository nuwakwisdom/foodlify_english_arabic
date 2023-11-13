import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Foodlify/features/home/domain/entities/cart_food_entity.dart.dart';

import '../../../home/domain/entities/restaurant_food_entity.dart';

part 'favourite_state.freezed.dart';

@freezed
class FavouriteState with _$FavouriteState {
  const factory FavouriteState.initial() = _$Initial;

  const factory FavouriteState.loading() = _$Loading;

  const factory FavouriteState.error({
    required String message,
  }) = _$Error;

  const factory FavouriteState.foods({
    required List<RestaurantFoodEntity> favourites,
  }) = _$Foods;
}
