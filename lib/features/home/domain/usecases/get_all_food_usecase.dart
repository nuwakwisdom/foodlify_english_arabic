import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_food_entity.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllFoodUsecase
    extends UseCase<RestaurantFoodEntity, GetAllFoodParams> {
  GetAllFoodUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<RestaurantFoodEntity>>> call(
    GetAllFoodParams params,
  ) =>
      homeRepository.getAllFood(
        location: params.location,
        page: params.page,
      );
}

class GetAllFoodParams extends Equatable {
  const GetAllFoodParams({
    required this.location,
    required this.page,
  });
  final String location;
  final int page;

  @override
  List<Object?> get props => [
        location,
        page,
      ];
}
