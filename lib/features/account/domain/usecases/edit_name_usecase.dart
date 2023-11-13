// ignore_for_file: non_constant_identifier_names

import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/account/domain/repositories/account_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditNameUsecase extends UseCase<bool, EditNameParams> {
  EditNameUsecase({
    required this.accountRepository,
  });

  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, bool>> call(
    EditNameParams params,
  ) =>
      accountRepository.editName(new_name: params.new_name);
}

class EditNameParams extends Equatable {
  const EditNameParams({
    required this.new_name,
  });
  final String new_name;

  @override
  List<Object?> get props => [
        new_name,
      ];
}
