// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class RestauranttPersonEntity extends Equatable {
  const RestauranttPersonEntity({
    this.surnname,
    this.email,
    this.first_name,
    this.phone_number,
    this.identity_type,
    this.identity_file_url,
  });

  final String? surnname;
  final String? email;
  final String? first_name;
  final String? phone_number;
  final String? identity_type;
  final String? identity_file_url;
  @override
  List<Object?> get props => [
        surnname,
        email,
        first_name,
        phone_number,
        identity_file_url,
        identity_type
      ];
}
