import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/notificationn_entity.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetNotificationUsecase extends UseCase<NotificationnEntities, NoParams> {
  GetNotificationUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<NotificationnEntities>>> call(NoParams params) =>
      homeRepository.getNNotification();
}
