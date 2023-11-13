import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_top_up_state.freezed.dart';

@freezed
class WalletTopUpState with _$WalletTopUpState {
  const factory WalletTopUpState.initial() = _$Initial;

  const factory WalletTopUpState.loading() = _$Loading;

  const factory WalletTopUpState.error({
    required String message,
}) = _$Error;

  const factory WalletTopUpState.checkOut({
    required String url,
}) = _$Success;
}
