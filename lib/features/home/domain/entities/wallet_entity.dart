// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class WalletEntity extends Equatable {
  const WalletEntity({
    required this.balance,
    required this.first_name,
    required this.last_name,
    required this.wallet_id,
    required this.bank_name,
    required this.settlement_amount,
  });
  final num balance;
  final String first_name;
  final String last_name;
  final String wallet_id;
  final String bank_name;
  final num settlement_amount;
  @override
  List<Object?> get props => [
        balance,
        first_name,
        last_name,
        wallet_id,
        bank_name,
        settlement_amount,
      ];
}
