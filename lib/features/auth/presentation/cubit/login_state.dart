part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.loggedIn() = _LoggedIn;
  const factory LoginState.error({required String error}) = _Error;
}
