part of 'get_cart_cubit.dart';

@freezed
class GetCartState with _$GetCartState {
  const factory GetCartState.initial() = _Initial;
  const factory GetCartState.loading() = _Loading;
  const factory GetCartState.success({required NewCartEntity carts}) = _Success;
  const factory GetCartState.error({required String error}) = _Error;
}
