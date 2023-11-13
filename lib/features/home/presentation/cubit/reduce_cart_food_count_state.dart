part of 'reduce_cart_food_count_cubit.dart';

@freezed
class ReduceCartFoodCountState with _$ReduceCartFoodCountState {
  const factory ReduceCartFoodCountState.initial() = _Initial;
  const factory ReduceCartFoodCountState.loadingz() = _Loading;
  const factory ReduceCartFoodCountState.success() = _Success;
  const factory ReduceCartFoodCountState.error() = _Error;
}
