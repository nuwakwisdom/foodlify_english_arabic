import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_food_entity.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFoodByRestaurantUsecase
    extends UseCase<RestaurantFoodEntity, RestaurantFoodParams> {
  GetFoodByRestaurantUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<RestaurantFoodEntity>>> call(
    RestaurantFoodParams params,
  ) =>
      homeRepository.getFoodByRestaurant(
        id: params.id,
        location: params.location,
      );
}

class RestaurantFoodParams extends Equatable {
  const RestaurantFoodParams({
    required this.location,
    required this.id,
  });
  final String location;
  final String id;

  @override
  List<Object?> get props => [location, id];
}
