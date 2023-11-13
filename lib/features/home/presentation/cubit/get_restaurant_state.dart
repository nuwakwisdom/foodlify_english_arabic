part of 'get_restaurant_cubit.dart';

@freezed
class GetRestaurantState with _$GetRestaurantState {
  const factory GetRestaurantState.initial() = _Initial;
  const factory GetRestaurantState.loading() = _Loading;
  const factory GetRestaurantState.success({
    required List<RestaurantEntity>? restaurant,
  }) = _Success;
  const factory GetRestaurantState.error({
    required String error,
  }) = _Error;
}
