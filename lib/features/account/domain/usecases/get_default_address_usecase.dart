import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/account/domain/entities/delivery_address_entities.dart';
import 'package:Foodlify/features/account/domain/repositories/account_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetDefaultAdressUsecase extends UseCase<DeliveryAddressEntity, NoParams> {
  GetDefaultAdressUsecase({
    required this.accountRepository,
  });

  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, DeliveryAddressEntity>> call(
    NoParams params,
  ) async {
    return accountRepository.getDefaultDeliveryAddress();
  }
}
