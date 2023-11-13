import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/orders_entity.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class GetOrderstUsecase extends UseCase<OrdersEntity, NoParams> {
  GetOrderstUsecase({
    required this.homeRespository,
  });

  final HomeRepository homeRespository;

  @override
  Future<Either<Failure, List<OrdersEntity>>> call(
    NoParams params,
  ) async {
    return homeRespository.getOrders();
  }
}
