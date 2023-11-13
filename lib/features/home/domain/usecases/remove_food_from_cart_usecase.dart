import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class RemoveFoodFromCartUsecase
    extends UseCase<bool, RemoveFoodFromCartParams> {
  RemoveFoodFromCartUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(
    RemoveFoodFromCartParams params,
  ) =>
      homeRepository.removeFoodFromCart(foodId: params.foodId);
}

class RemoveFoodFromCartParams extends Equatable {
  const RemoveFoodFromCartParams({
    required this.foodId,
  });
  final String foodId;

  @override
  List<Object?> get props => [
        foodId,
      ];
}
