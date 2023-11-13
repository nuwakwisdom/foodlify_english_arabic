part of 'add_to_cart_cubit.dart';

@freezed
class AddToCartState with _$AddToCartState {
  const factory AddToCartState.initial() = _Initial;
  const factory AddToCartState.loading() = _Loading;
  const factory AddToCartState.added() = _Added;
  const factory AddToCartState.error({required String error}) = _Error;
}
