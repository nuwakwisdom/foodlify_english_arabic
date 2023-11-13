// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class UsersEntity extends Equatable {
  const UsersEntity({
    this.email,
    this.enabled,
    this.first_name,
    this.last_name,
    this.phone_number,
    this.profile_completed,
    this.has_referral_code,
    this.referral_count,
    this.referral_code,
  });
  final String? email;
  final bool? enabled;
  final String? first_name;
  final String? last_name;
  final String? phone_number;
  final bool? profile_completed;
  final bool? has_referral_code;
  final int? referral_count;
  final String? referral_code;
  @override
  List<Object?> get props => [
        email,
        enabled,
        first_name,
        last_name,
        phone_number,
        profile_completed,
        has_referral_code,
        referral_count,
        referral_code,
      ];
}
