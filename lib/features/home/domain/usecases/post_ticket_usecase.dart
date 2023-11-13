import 'package:Foodlify/core/errors/failure.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PostTicketUsecase extends UseCase<bool, PostTicketParams> {
  PostTicketUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(
    PostTicketParams params,
  ) =>
      homeRepository.postTicket(
        category: params.category,
        message: params.message,
      );
}

class PostTicketParams extends Equatable {
  const PostTicketParams({
    required this.category,
    required this.message,
  });
  final String category;
  final String message;

  @override
  List<Object?> get props => [
        category,
        message,
      ];
}
