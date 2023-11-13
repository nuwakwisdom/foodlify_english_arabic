// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryAddressModel _$DeliveryAddressModelFromJson(
        Map<String, dynamic> json) =>
    DeliveryAddressModel(
      address: json['address'] as String,
      address_id: json['address_id'] as String,
      contact_name: json['contact_name'] as String,
      phone_number: json['phone_number'] as String,
      is_default: json['is_default'] as bool?,
    );

Map<String, dynamic> _$DeliveryAddressModelToJson(
        DeliveryAddressModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address_id': instance.address_id,
      'contact_name': instance.contact_name,
      'phone_number': instance.phone_number,
      'is_default': instance.is_default,
    };
