import 'package:Foodlify/core/errors/failure.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ViewNotificationUsecase extends UseCase<bool, ViewNotificationParam> {
  ViewNotificationUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(
    ViewNotificationParam params,
  ) =>
      homeRepository.viewNotification(
        id: params.id,
      );
}

class ViewNotificationParam extends Equatable {
  const ViewNotificationParam({
    required this.id,
  });

  final int id;

  @override
  List<Object?> get props => [
        id,
      ];
}
