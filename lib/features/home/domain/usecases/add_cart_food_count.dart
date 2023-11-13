import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddCartFoodCountUsecase extends UseCase<bool, AddCartFoodCountParams> {
  AddCartFoodCountUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(
    AddCartFoodCountParams params,
  ) =>
      homeRepository.addFoodCart(
          foodId: params.foodId, quantity: params.quantity);
}

class AddCartFoodCountParams extends Equatable {
  const AddCartFoodCountParams({
    required this.foodId,
    required this.quantity,
  });
  final String foodId;
  final int quantity;

  @override
  List<Object?> get props => [
        foodId,
        quantity,
      ];
}
