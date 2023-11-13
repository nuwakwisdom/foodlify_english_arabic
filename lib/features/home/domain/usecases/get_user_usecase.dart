import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/users_entity.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class GetUserUsecase extends UseCase<UsersEntity, NoParams> {
  GetUserUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, UsersEntity>> call(NoParams) =>
      homeRepository.getUser();
}
