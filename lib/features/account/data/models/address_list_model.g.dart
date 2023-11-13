// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressListModel _$AddressListModelFromJson(Map<String, dynamic> json) =>
    AddressListModel(
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => DeliveryAddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressListModelToJson(AddressListModel instance) =>
    <String, dynamic>{
      'body': instance.body,
    };
