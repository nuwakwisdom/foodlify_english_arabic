import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/auth/domain/repositories/repositories.dart';

@lazySingleton
class RegisterWithPhoneUsecase extends UseCase<bool, RegisterWithPhoneParams> {
  RegisterWithPhoneUsecase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    RegisterWithPhoneParams params,
  ) =>
      authRepository.registerWithPhone(
        firstName: params.firstNName,
        lastName: params.lastName,
        password: params.password,
        phone: params.phone,
        referralCode: params.referralCode,
      );
}

class RegisterWithPhoneParams extends Equatable {
  const RegisterWithPhoneParams({
    required this.password,
    required this.phone,
    required this.firstNName,
    required this.lastName,
    this.referralCode,
  });
  final String firstNName;
  final String lastName;
  final String password;
  final String phone;
  final String? referralCode;

  @override
  List<Object?> get props => [
        firstNName,
        lastName,
        password,
        phone,
        referralCode,
      ];
}
