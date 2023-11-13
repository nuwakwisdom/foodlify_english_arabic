import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/auth/domain/repositories/repositories.dart';

@lazySingleton
class SetPasswordUsecase extends UseCase<bool, SetPasswordParams> {
  SetPasswordUsecase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    SetPasswordParams params,
  ) =>
      authRepository.setPassword(
        password: params.password,
        confirmPassword: params.confirmPassword,
      );
}

class SetPasswordParams extends Equatable {
  const SetPasswordParams({
    required this.password,
    required this.confirmPassword,
  });
  final String password;
  final String confirmPassword;

  @override
  List<Object?> get props => [
        password,
        confirmPassword,
      ];
}
