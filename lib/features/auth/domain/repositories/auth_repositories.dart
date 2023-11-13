// ignore_for_file: one_member_abstracts

import 'package:Foodlify/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> registerWithEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? referralCode,
  });
  Future<Either<Failure, bool>> registerWithPhone({
    required String firstName,
    required String lastName,
    required String password,
    required String phone,
    String? referralCode,
  });
  Future<Either<Failure, bool>> loginWithEmail({
    required String username,
    required String password,
  });
  Future<Either<Failure, bool>> setPassword({
    required String password,
    required String confirmPassword,
  });
  Future<Either<Failure, bool>> resendOtpEmail({
    required String email,
  });
  Future<Either<Failure, bool>> confirmOtp({
    required String username,
    required String otp,
  });
  Future<Either<Failure, bool>> resendOtpSms({
    required String phoneNumber,
  });
  Future<Either<Failure, bool>> updateProfileWithPhoneNumber({
    required String phoneNumber,
    required String email,
    required String fullName,
  });
  Future<Either<Failure, bool>> updateProfileWithEmail({
    required String phoneNumber,
    required String email,
    required String fullName,
  });
  Future<Either<Failure, bool>> resetPasswordByEmail({
    required String email,
  });
  Future<Either<Failure, bool>> changePasswordWithEmail({
    required String email,
    required String token,
    required String newPassword,
  });
  Future<Either<Failure, bool>> resetPasswoordPhone({
    required String phoneNumber,
  });
  Future<Either<Failure, bool>> logout();
}
