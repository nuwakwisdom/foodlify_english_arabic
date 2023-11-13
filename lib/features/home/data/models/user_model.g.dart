// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      email: json['email'] as String?,
      enabled: json['enabled'] as bool?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      phone_number: json['phone_number'] as String?,
      profile_completed: json['profile_completed'] as bool?,
      has_referral_code: json['has_referral_code'] as bool?,
      referral_count: json['referral_count'] as int?,
      referral_code: json['referral_code'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'email': instance.email,
      'enabled': instance.enabled,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'phone_number': instance.phone_number,
      'profile_completed': instance.profile_completed,
      'has_referral_code': instance.has_referral_code,
      'referral_count': instance.referral_count,
      'referral_code': instance.referral_code,
    };
