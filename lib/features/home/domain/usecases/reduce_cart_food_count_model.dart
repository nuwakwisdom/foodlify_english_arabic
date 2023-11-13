import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class ReduceCartFoodCountUsecase
    extends UseCase<bool, ReduceCartFoodCountParams> {
  ReduceCartFoodCountUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(
    ReduceCartFoodCountParams params,
  ) =>
      homeRepository.reduceFoodCart(
        foodId: params.foodId,
        quantity: params.quantity,
      );
}

class ReduceCartFoodCountParams extends Equatable {
  const ReduceCartFoodCountParams({
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
