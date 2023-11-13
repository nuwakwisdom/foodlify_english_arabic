import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_food_entity.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFoodByCategoriesUsecase
    extends UseCase<RestaurantFoodEntity, GetFoodByCategoryParams> {
  GetFoodByCategoriesUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<RestaurantFoodEntity>>> call(
    GetFoodByCategoryParams params,
  ) =>
      homeRepository.getFoodByCategoryAndLoaction(
        location: params.location,
        category: params.category,
      );
}

class GetFoodByCategoryParams extends Equatable {
  const GetFoodByCategoryParams(
      {required this.location, required this.category});
  final String location;
  final String category;

  @override
  List<Object?> get props => [
        location,
        category,
      ];
}
