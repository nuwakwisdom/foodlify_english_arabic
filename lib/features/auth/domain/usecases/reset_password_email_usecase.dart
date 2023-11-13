import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/auth/domain/repositories/repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ResetPasswordEmailUsecase
    extends UseCase<bool, ResetPasswordEmailParams> {
  ResetPasswordEmailUsecase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    ResetPasswordEmailParams params,
  ) =>
      authRepository.resetPasswordByEmail(
        email: params.email,
      );
}

class ResetPasswordEmailParams extends Equatable {
  const ResetPasswordEmailParams({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [
        email,
      ];
}
