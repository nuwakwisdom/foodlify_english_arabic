import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/auth/domain/repositories/repositories.dart';

@lazySingleton
class SendOtpUsecase extends UseCase<bool, SendOtpParams> {
  SendOtpUsecase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    SendOtpParams params,
  ) =>
      authRepository.resendOtpEmail(
        email: params.email,
      );
}

class SendOtpParams extends Equatable {
  const SendOtpParams({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [
        email,
      ];
}
