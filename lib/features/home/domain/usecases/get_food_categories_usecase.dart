import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/food_category_entity.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class GetFoodCategoriesUsecase
    extends UseCase<FoodCategoryEntity, FoodCategoriesParams> {
  GetFoodCategoriesUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<FoodCategoryEntity>>> call(
    FoodCategoriesParams params,
  ) =>
      homeRepository.getFoodCategories(
        locstion: params.location,
      );
}

class FoodCategoriesParams extends Equatable {
  const FoodCategoriesParams({
    required this.location,
  });
  final String location;

  @override
  List<Object?> get props => [location];
}
