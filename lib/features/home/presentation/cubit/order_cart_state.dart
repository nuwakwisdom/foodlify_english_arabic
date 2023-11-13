part of 'order_cart_cubit.dart';

@freezed
class OrderCartState with _$OrderCartState {
  const factory OrderCartState.initial() = _Initial;
  const factory OrderCartState.loading() = _Looading;
  const factory OrderCartState.success() = _Success;
  const factory OrderCartState.error() = _Error;
}
