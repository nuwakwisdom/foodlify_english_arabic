// ignore_for_file: non_constant_identifier_names

import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/account/domain/repositories/account_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetDefaultAddressUsecase extends UseCase<bool, SetDefaultAddressParam> {
  SetDefaultAddressUsecase({
    required this.accountRepository,
  });

  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, bool>> call(
    SetDefaultAddressParam params,
  ) =>
      accountRepository.setDefaultAdress(
        address_id: params.address_id,
      );
}

class SetDefaultAddressParam extends Equatable {
  const SetDefaultAddressParam({
    required this.address_id,
  });
  final String address_id;

  @override
  List<Object?> get props => [
        address_id,
      ];
}
