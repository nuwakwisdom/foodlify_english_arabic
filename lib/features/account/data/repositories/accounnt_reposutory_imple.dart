// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

import 'package:Foodlify/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
// ignore: directives_ordering
import 'package:Foodlify/features/account/data/datasources/account_remote_datasauce.dart';
import 'package:Foodlify/features/account/data/models/delivery_address_model.dart';
import 'package:Foodlify/features/account/domain/repositories/account_repository.dart';

@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl extends AccountRepository {
  AccountRepositoryImpl({
    required this.accountDataSource,
  });
  final AccountRemoteDatasource accountDataSource;

  @override
  Future<Either<Failure, bool>> updateDeliveryAddress({
    required String contact_name,
    required String address,
    required String phone_number,
  }) async {
    try {
      final response = await accountDataSource.updateDeliveryAddress(
        contact_name: contact_name,
        address: address,
        phone_number: phone_number,
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
  Future<Either<Failure, List<DeliveryAddressModel>>>
      getDeliveryAddress() async {
    try {
      final response = await accountDataSource.getDeliveryAddress();
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
  Future<Either<Failure, bool>> setDefaultAdress({
    required String address_id,
  }) async {
    try {
      final response = await accountDataSource.setDefaultAddress(
        address_id: address_id,
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
  Future<Either<Failure, bool>> editName({required String new_name}) async {
    try {
      final response = await accountDataSource.editName(new_name: new_name);
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
  Future<Either<Failure, DeliveryAddressModel>>
      getDefaultDeliveryAddress() async {
    try {
      final response = await accountDataSource.getDefaultAddress();
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
