part of 'order_food_cubit.dart';

@freezed
class OrderFoodState with _$OrderFoodState {
  const factory OrderFoodState.initial() = _Initial;
  const factory OrderFoodState.loading() = _Loading;
  const factory OrderFoodState.success() = _Success;
  const factory OrderFoodState.error() = _Error;
}
