part of 'get_all_restaurant_cubit.dart';

@freezed
class GetAllRestaurantState with _$GetAllRestaurantState {
  const factory GetAllRestaurantState.initial() = _Initial;
  const factory GetAllRestaurantState.loading() = _Loading;
  const factory GetAllRestaurantState.success() = _Success;
  const factory GetAllRestaurantState.error() = _Error;
}
