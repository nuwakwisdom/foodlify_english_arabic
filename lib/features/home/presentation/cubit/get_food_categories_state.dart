part of 'get_food_categories_cubit.dart';

@freezed
class GetFoodCategoriesState with _$GetFoodCategoriesState {
  const factory GetFoodCategoriesState.initial() = _Initial;
  const factory GetFoodCategoriesState.loading() = _loading;
  const factory GetFoodCategoriesState.success() = _Success;
  const factory GetFoodCategoriesState.error({
    required String error,
  }) = _Error;
}
