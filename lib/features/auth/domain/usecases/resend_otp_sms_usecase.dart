import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/auth/domain/repositories/repositories.dart';

@lazySingleton
class ResendOtpSmsUsecase extends UseCase<bool, ResendOtpSmsParams> {
  ResendOtpSmsUsecase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    ResendOtpSmsParams params,
  ) =>
      authRepository.resendOtpSms(
        phoneNumber: params.phoneNumber,
      );
}

class ResendOtpSmsParams extends Equatable {
  const ResendOtpSmsParams({
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  List<Object?> get props => [
        phoneNumber,
      ];
}
