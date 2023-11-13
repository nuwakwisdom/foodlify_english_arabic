// ignore_for_file: non_constant_identifier_names

import 'package:Foodlify/features/account/domain/entities/delivery_address_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivery_address_model.g.dart';

@JsonSerializable()
class DeliveryAddressModel extends DeliveryAddressEntity {
  const DeliveryAddressModel({
    required super.address,
    required super.address_id,
    required super.contact_name,
    required super.phone_number,
    super.is_default,
  });
  factory DeliveryAddressModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryAddressModelToJson(this);
}
