import 'package:Foodlify/core/errors/failure.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/ticket_entity.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTicketUsecase extends UseCase<TicketEntity, TicketParams> {
  GetTicketUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<TicketEntity>>> call(
    TicketParams params,
  ) =>
      homeRepository.getTickest(page: params.page);
}

class TicketParams extends Equatable {
  const TicketParams({
    required this.page,
  });

  final int page;

  @override
  List<Object?> get props => [page];
}
