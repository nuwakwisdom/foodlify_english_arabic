// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) => WalletModel(
      balance: json['balance'] as num,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      wallet_id: json['wallet_id'] as String,
      bank_name: json['bank_name'] as String,
      settlement_amount: json['settlement_amount'] as num,
    );

Map<String, dynamic> _$WalletModelToJson(WalletModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'wallet_id': instance.wallet_id,
      'bank_name': instance.bank_name,
      'settlement_amount': instance.settlement_amount,
    };
