part of 'register_number_cubit.dart';

@freezed
class RegisterNumberState with _$RegisterNumberState {
  const factory RegisterNumberState.initial() = _Initial;
  const factory RegisterNumberState.loading() = _Loading;
  const factory RegisterNumberState.registered() = _Registered;
  const factory RegisterNumberState.error({required String error}) = _Error;
}
