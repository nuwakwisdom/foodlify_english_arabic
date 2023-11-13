// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class DeliveryAddressEntity extends Equatable {
  const DeliveryAddressEntity({
    required this.address,
    required this.address_id,
    required this.contact_name,
    required this.phone_number,
    this.is_default,
  });
  final String address;
  final String address_id;
  final String contact_name;
  final String phone_number;
  final bool? is_default;
  @override
  List<Object?> get props => [
        address,
        address_id,
        contact_name,
        phone_number,
        is_default,
      ];
}
