import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class AddToCartUsecase extends UseCase<bool, AddToCartParams> {
  AddToCartUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(
    AddToCartParams params,
  ) =>
      homeRepository.addToCart(
        foodId: params.foodId,
        qty: params.qty,
      );
}

class AddToCartParams extends Equatable {
  const AddToCartParams({
    required this.foodId,
    required this.qty,
  });
  final String foodId;
  final int qty;

  @override
  List<Object?> get props => [
        foodId,
        qty,
      ];
}
