import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/auth/domain/repositories/repositories.dart';

@lazySingleton
class RegisterWithEmailUsecase extends UseCase<bool, RegisterWithEmailParams> {
  RegisterWithEmailUsecase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    RegisterWithEmailParams params,
  ) =>
      authRepository.registerWithEmail(
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        password: params.password,
        referralCode: params.referralCode,
      );
}

class RegisterWithEmailParams extends Equatable {
  const RegisterWithEmailParams({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    this.referralCode,
  });
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String? referralCode;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
        referralCode,
      ];
}
