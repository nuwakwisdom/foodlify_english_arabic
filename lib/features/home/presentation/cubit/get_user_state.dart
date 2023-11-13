part of 'get_user_cubit.dart';

@freezed
class GetUserState with _$GetUserState {
  const factory GetUserState.initial() = _Initial;
  const factory GetUserState.loading() = _Loading;
  const factory GetUserState.success({
    required UsersEntity users,
  }) = _Success;
  const factory GetUserState.error() = _Error;
}
