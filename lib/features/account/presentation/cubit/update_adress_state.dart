part of 'update_adress_cubit.dart';

@freezed
class UpdateAdressState with _$UpdateAdressState {
  const factory UpdateAdressState.initial() = _Initial;
  const factory UpdateAdressState.loading() = _Loadinng;
  const factory UpdateAdressState.success() = _Success;
  const factory UpdateAdressState.error() = _Error;
}
