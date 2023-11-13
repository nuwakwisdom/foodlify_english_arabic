import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/auth/domain/repositories/repositories.dart';

@lazySingleton
class VerifyOtpUsecase extends UseCase<bool, VerifyOtpParams> {
  VerifyOtpUsecase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    VerifyOtpParams params,
  ) =>
      authRepository.confirmOtp(
        username: params.username,
        otp: params.otp,
      );
}

class VerifyOtpParams extends Equatable {
  const VerifyOtpParams({
    required this.username,
    required this.otp,
  });

  final String username;
  final String otp;

  @override
  List<Object?> get props => [
        username,
        otp,
      ];
}
