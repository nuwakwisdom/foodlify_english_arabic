// ignore_for_file: non_constant_identifier_names

import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/account/domain/repositories/account_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateAddressUsecase extends UseCase<bool, UpdateAddressParams> {
  UpdateAddressUsecase({
    required this.accountRepository,
  });

  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, bool>> call(
    UpdateAddressParams params,
  ) =>
      accountRepository.updateDeliveryAddress(
        contact_name: params.contact_name,
        address: params.address,
        phone_number: params.phone_number,
      );
}

class UpdateAddressParams extends Equatable {
  const UpdateAddressParams({
    required this.contact_name,
    required this.address,
    required this.phone_number,
  });
  final String contact_name;
  final String address;
  final String phone_number;

  @override
  List<Object?> get props => [
        contact_name,
        address,
        phone_number,
      ];
}
