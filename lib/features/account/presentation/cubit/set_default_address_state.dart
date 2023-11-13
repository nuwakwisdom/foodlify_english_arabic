part of 'set_default_address_cubit.dart';

@freezed
class SetDefaultAddressState with _$SetDefaultAddressState {
  const factory SetDefaultAddressState.initial() = _Initial;
  const factory SetDefaultAddressState.loading() = _Loading;
  const factory SetDefaultAddressState.success() = _Success;
  const factory SetDefaultAddressState.error() = _Error;
}
