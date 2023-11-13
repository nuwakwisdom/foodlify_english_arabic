import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/auth/domain/repositories/repositories.dart';

@lazySingleton
class ChangePasswordEmailUsecase
    extends UseCase<bool, ChangePasswordEmailParams> {
  ChangePasswordEmailUsecase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    ChangePasswordEmailParams params,
  ) =>
      authRepository.changePasswordWithEmail(
        email: params.email,
        token: params.token,
        newPassword: params.newPassword,
      );
}

class ChangePasswordEmailParams extends Equatable {
  const ChangePasswordEmailParams({
    required this.email,
    required this.token,
    required this.newPassword,
  });
  final String email;
  final String token;
  final String newPassword;

  @override
  List<Object?> get props => [
        email,
        token,
        newPassword,
      ];
}
