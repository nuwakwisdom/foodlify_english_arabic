import 'dart:io';

import 'package:Foodlify/core/errors/failure.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PutTicketFieldUsecase extends UseCase<bool, PutTicketFileParams> {
  PutTicketFieldUsecase({
    required this.homeRepository,
  });

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(
    PutTicketFileParams params,
  ) =>
      homeRepository.putTicketFilde(
          ticketId: params.ticketId, file: params.file);
}

class PutTicketFileParams extends Equatable {
  const PutTicketFileParams({
    required this.ticketId,
    required this.file,
  });
  final String ticketId;
  final File file;

  @override
  List<Object?> get props => [
        ticketId,
        file,
      ];
}
