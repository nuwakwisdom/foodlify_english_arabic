// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:Foodlify/features/home/domain/entities/wallet_entity.dart';
part 'wallet_model.g.dart';

@JsonSerializable()
class WalletModel extends WalletEntity {
  const WalletModel({
    required super.balance,
    required super.first_name,
    required super.last_name,
    required super.wallet_id,
    required super.bank_name,
    required super.settlement_amount,
  });
  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletModelToJson(this);
}
