// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class OrderFoodUsercase extends UseCase<bool, OrderFoodParams> {
  OrderFoodUsercase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(
    OrderFoodParams params,
  ) =>
      homeRepository.orderFood(
        foodId: params.foodId,
        amountPaid: params.amountPaid,
        address_id: params.address_id,
      );
}

class OrderFoodParams extends Equatable {
  const OrderFoodParams({
    required this.foodId,
    required this.amountPaid,
    required this.address_id,
  });
  final String foodId;
  final num amountPaid;
  final String address_id;

  @override
  List<Object?> get props => [
        foodId,
        amountPaid,
        address_id,
      ];
}
