// ignore_for_file: lines_longer_than_80_chars

import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/features/auth/data/datasources/auth_remote_data_sorce.dart';
import 'package:Foodlify/features/auth/domain/repositories/repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.remoteDatasource,
  });

  final AuthRemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, bool>> loginWithEmail({
    required String username,
    required String password,
  }) async {
    try {
      final response = await remoteDatasource.loginWithEmail(
        username: username,
        password: password,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> registerWithPhone({
    required String firstName,
    required String lastName,
    required String password,
    required String phone,
    String? referralCode,
  }) async {
    try {
      final response = await remoteDatasource.registerWithPhone(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        password: password,
        referralCode: referralCode,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> resendOtpEmail({
    required String email,
  }) async {
    try {
      final response = await remoteDatasource.resendOtpEmail(
        email: email,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> setPassword({
    required String password,
    required String confirmPassword,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> confirmOtp({
    required String username,
    required String otp,
  }) async {
    try {
      final response = await remoteDatasource.confirmOtp(
        username: username,
        otp: otp,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> registerWithEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? referralCode,
  }) async {
    try {
      final response = await remoteDatasource.resgisterWithEmail(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        referralCode: referralCode,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> resendOtpSms({
    required String phoneNumber,
  }) async {
    try {
      final response = await remoteDatasource.resendOtpSms(
        number: phoneNumber,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> updateProfileWithPhoneNumber({
    required String phoneNumber,
    required String email,
    required String fullName,
  }) async {
    try {
      final response = await remoteDatasource.updateProfileWithNumber(
        email: email,
        phoneNumber: phoneNumber,
        fullName: fullName,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> updateProfileWithEmail({
    required String phoneNumber,
    required String email,
    required String fullName,
  }) async {
    try {
      final response = await remoteDatasource.updateProfileWithEmail(
        phoneNumber: phoneNumber,
        email: email,
        fullName: fullName,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> resetPasswordByEmail({
    required String email,
  }) async {
    try {
      final response = await remoteDatasource.resetPasswordEmail(
        email: email,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> changePasswordWithEmail({
    required String email,
    required String token,
    required String newPassword,
  }) async {
    try {
      final response = await remoteDatasource.changePasswordEmail(
        email: email,
        token: token,
        newPassword: newPassword,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> resetPasswoordPhone({
    required String phoneNumber,
  }) async {
    try {
      final response = await remoteDatasource.resetPasswordPhoneNumber(
        phoneNumber: phoneNumber,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final response = await remoteDatasource.logout();
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }
}
