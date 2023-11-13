import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/carts_entity.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class GetCartUsecase extends UseCase<NewCartEntity, NoParams> {
  GetCartUsecase({
    required this.homeRespository,
  });

  final HomeRepository homeRespository;

  @override
  Future<Either<Failure, NewCartEntity>> call(
    NoParams params,
  ) async {
    return homeRespository.getCarts();
  }
}
