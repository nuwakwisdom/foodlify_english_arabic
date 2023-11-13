import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/auth/domain/repositories/repositories.dart';

@lazySingleton
class LoginWithEmailUsecase extends UseCase<bool, LoginWithEmailParams> {
  LoginWithEmailUsecase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    LoginWithEmailParams params,
  ) =>
      authRepository.loginWithEmail(
        username: params.username,
        password: params.password,
      );
}

class LoginWithEmailParams extends Equatable {
  const LoginWithEmailParams({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
