part of 'get_address_cubit.dart';

@freezed
class GetAddressState with _$GetAddressState {
  const factory GetAddressState.initial() = _Initial;
  const factory GetAddressState.loading() = _Loading;
  const factory GetAddressState.success({
    required List<DeliveryAddressEntity> deliveryAddresses,
    required DeliveryAddressEntity defaultDelliveryAddress,
  }) = _Success;
  const factory GetAddressState.error() = _Error;
}
