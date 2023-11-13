import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_entitties.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class GetRestaurantUsecase extends UseCase<RestaurantEntity, NoParams> {
  GetRestaurantUsecase({
    required this.homeRespository,
  });

  final HomeRepository homeRespository;

  @override
  Future<Either<Failure, List<RestaurantEntity>>> call(
    NoParams params,
  ) async {
    return homeRespository.getRestaurants();
  }
}
