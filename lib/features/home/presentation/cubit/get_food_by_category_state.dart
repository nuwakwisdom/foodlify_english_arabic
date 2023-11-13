part of 'get_food_by_category_cubit.dart';

@freezed
class GetFoodByCategoryState with _$GetFoodByCategoryState {
  const factory GetFoodByCategoryState.initial() = _Initial;
  const factory GetFoodByCategoryState.loading() = _Loading;
  const factory GetFoodByCategoryState.success({
    required List<RestaurantFoodEntity> foodByCategries,
  }) = _Success;
  const factory GetFoodByCategoryState.error() = _Error;
}
