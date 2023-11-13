import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/auth/domain/repositories/repositories.dart';

@lazySingleton
class UpdateProfileWithPhoneNumberUsecase
    extends UseCase<bool, UpdateProfileWithNumberParams> {
  UpdateProfileWithPhoneNumberUsecase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    UpdateProfileWithNumberParams params,
  ) =>
      authRepository.updateProfileWithPhoneNumber(
        phoneNumber: params.phoneNumber,
        email: params.email,
        fullName: params.fullName,
      );
}

class UpdateProfileWithNumberParams extends Equatable {
  const UpdateProfileWithNumberParams({
    required this.email,
    required this.phoneNumber,
    required this.fullName,
  });

  final String email;
  final String phoneNumber;
  final String fullName;

  @override
  List<Object?> get props => [email, phoneNumber, fullName];
}
