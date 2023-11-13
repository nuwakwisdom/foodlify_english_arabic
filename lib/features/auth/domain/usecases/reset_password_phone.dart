import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/auth/domain/repositories/repositories.dart';

@lazySingleton
class ResetPasswordPhoneUsecase
    extends UseCase<bool, ResetPasswordPhoneParams> {
  ResetPasswordPhoneUsecase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    ResetPasswordPhoneParams params,
  ) =>
      authRepository.resetPasswoordPhone(
        phoneNumber: params.phoneNumber,
      );
}

class ResetPasswordPhoneParams extends Equatable {
  const ResetPasswordPhoneParams({
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  List<Object?> get props => [
        phoneNumber,
      ];
}
