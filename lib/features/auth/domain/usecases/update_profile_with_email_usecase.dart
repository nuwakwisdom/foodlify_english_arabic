import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/auth/domain/repositories/repositories.dart';

@lazySingleton
class UpdateProfileWithEmailUsecase
    extends UseCase<bool, UpdateProfileWithEmailParams> {
  UpdateProfileWithEmailUsecase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    UpdateProfileWithEmailParams params,
  ) =>
      authRepository.updateProfileWithEmail(
        phoneNumber: params.phoneNumber,
        email: params.email,
        fullName: params.fullName,
      );
}

class UpdateProfileWithEmailParams extends Equatable {
  const UpdateProfileWithEmailParams({
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
