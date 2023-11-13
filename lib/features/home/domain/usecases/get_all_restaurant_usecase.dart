import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_entitties.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class GetAllRestaurantUsecase
    extends UseCase<RestaurantEntity, AllRestaurantParams> {
  GetAllRestaurantUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<RestaurantEntity>>> call(
    AllRestaurantParams params,
  ) =>
      homeRepository.getAllRestaurant(location: params.location);
}

class AllRestaurantParams extends Equatable {
  const AllRestaurantParams({
    required this.location,
  });
  final String location;

  @override
  List<Object?> get props => [location];
}
