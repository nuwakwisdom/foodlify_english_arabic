// ignore_for_file: non_constant_identifier_names, one_member_abstracts

import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/features/account/data/models/delivery_address_model.dart';
import 'package:dartz/dartz.dart';

abstract class AccountRepository {
  Future<Either<Failure, bool>> updateDeliveryAddress({
    required String contact_name,
    required String address,
    required String phone_number,
  });

  Future<Either<Failure, List<DeliveryAddressModel>>> getDeliveryAddress();
  Future<Either<Failure, bool>> setDefaultAdress({
    required String address_id,
  });
  Future<Either<Failure, bool>> editName({
    required String new_name,
  });
  Future<Either<Failure, DeliveryAddressModel>> getDefaultDeliveryAddress();
}
