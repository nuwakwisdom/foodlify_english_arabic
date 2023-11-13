part of 'get_restaurant_food_cubit.dart';

@freezed
class GetRestaurantFoodState with _$GetRestaurantFoodState {
  const factory GetRestaurantFoodState.initial() = _Initial;
  const factory GetRestaurantFoodState.loading() = _Loading;
  const factory GetRestaurantFoodState.success(
      {required List<RestaurantFoodEntity> restaurantsFood}) = _success;
  const factory GetRestaurantFoodState.erroe({required String error}) = _Error;
}
