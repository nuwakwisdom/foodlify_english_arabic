// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:Foodlify/features/home/domain/entities/users_entity.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UsersEntity {
  const UserModel({
    super.email,
    super.enabled,
    super.first_name,
    super.last_name,
    super.phone_number,
    super.profile_completed,
    super.has_referral_code,
    super.referral_count,
    super.referral_code,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
