// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class OrderCartUsecase extends UseCase<bool, OrderCartParams> {
  OrderCartUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(
    OrderCartParams params,
  ) =>
      homeRepository.orderCart(
          cartId: params.cartId, address_id: params.address_id);
}

class OrderCartParams extends Equatable {
  const OrderCartParams({
    required this.cartId,
    required this.address_id,
  });
  final String cartId;

  final String address_id;

  @override
  List<Object?> get props => [
        cartId,
        address_id,
      ];
}
