part of 'add_cart_food_count_cubit.dart';

@freezed
class AddCartFoodCountState with _$AddCartFoodCountState {
  const factory AddCartFoodCountState.initial() = _Initial;
  const factory AddCartFoodCountState.loading() = _Loading;
  const factory AddCartFoodCountState.success() = _Success;
  const factory AddCartFoodCountState.error() = _Error;
}
