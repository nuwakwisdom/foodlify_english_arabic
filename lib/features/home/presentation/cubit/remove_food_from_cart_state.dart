part of 'remove_food_from_cart_cubit.dart';

@freezed
class RemoveFoodFromCartState with _$RemoveFoodFromCartState {
  const factory RemoveFoodFromCartState.initial() = _Initial;
  const factory RemoveFoodFromCartState.loading() = _Loading;
  const factory RemoveFoodFromCartState.success() = _Success;
  const factory RemoveFoodFromCartState.error() = _Error;
}
