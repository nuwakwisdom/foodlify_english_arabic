import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Foodlify/features/home/domain/entities/users_entity.dart';

part 'generate_referral_code_state.freezed.dart';

@freezed
class GenerateReferralCodeState with _$GenerateReferralCodeState {
  const factory GenerateReferralCodeState.initial() = _$Initial;

  const factory GenerateReferralCodeState.loading() = _$Loading;

  const factory GenerateReferralCodeState.error({
    required String message,
  }) = _$Error;

  const factory GenerateReferralCodeState.generated({
    required UsersEntity usersEntity,
  }) = _$Generated;
}
