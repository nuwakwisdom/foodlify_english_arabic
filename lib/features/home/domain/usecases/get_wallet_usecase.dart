// ignore_for_file: type_annotate_public_apis, non_constant_identifier_names

import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/wallet_entity.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetWalletUsecase extends UseCase<WalletEntity, NoParams> {
  GetWalletUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, WalletEntity>> call(params) =>
      homeRepository.getWallet();
}
