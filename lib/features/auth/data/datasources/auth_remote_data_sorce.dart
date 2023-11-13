// ignore_for_file: one_member_abstracts, unawaited_futures, avoid_dynamic_calls, inference_failure_on_function_invocation, lines_longer_than_80_chars, avoid_print

import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/local_data/local_data.dart';
import 'package:Foodlify/core/network/network.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract class AuthRemoteDatasource {
  Future<bool> resgisterWithEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? referralCode,
  });
  Future<bool> registerWithPhone({
    required String firstName,
    required String lastName,
    required String phone,
    required String password,
    String? referralCode,
  });
  Future<bool> loginWithEmail({
    required String username,
    required String password,
  });
  Future<bool> setPassword({
    required String password,
    required String confirmPassword,
  });
  Future<bool> resendOtpEmail({
    required String email,
  });
  Future<bool> confirmOtp({
    required String username,
    required String otp,
  });
  Future<bool> resendOtpSms({
    required String number,
  });
  Future<bool> updateProfileWithNumber({
    required String phoneNumber,
    required String email,
    required String fullName,
  });
  Future<bool> updateProfileWithEmail({
    required String phoneNumber,
    required String email,
    required String fullName,
  });
  Future<bool> resetPasswordEmail({
    required String email,
  });
  Future<bool> changePasswordEmail({
    required String email,
    required String token,
    required String newPassword,
  });
  Future<bool> resetPasswordPhoneNumber({
    required String phoneNumber,
  });

  Future<bool> logout();
}

@LazySingleton(as: AuthRemoteDatasource)
class AuthhRemoteDatasourceImpl extends AuthRemoteDatasource {
  AuthhRemoteDatasourceImpl({
    required this.networkInfo,
    required this.apiRequester,
    required this.localDataStorage,
  });
  final NetworkInfo networkInfo;
  final ApiRequester apiRequester;
  final LocalDataStorage localDataStorage;

  @override
  Future<bool> resgisterWithEmail({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? referralCode,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'referral_code': referralCode
      };
      final dio = Dio();
      Logger().d(body);
      final response = await dio.post(
        'http://ec2-18-212-83-34.compute-1.amazonaws.com:8090/api/v1/auth/user/email/registration',
        data: body,
        options: Options(),
      );

      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> registerWithPhone({
    required String firstName,
    required String lastName,
    required String password,
    required String phone,
    String? referralCode,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phone,
        'password': password,
        'referral_code': referralCode,
      };
      final dio = Dio();
      Logger().d(body);
      final response = await dio.post(
        'http://34.194.114.40:8090/api/v1/auth/user/number/registration',
        data: body,
        options: Options(),
      );

      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> loginWithEmail({
    required String username,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {
        'username': username,
        'password': password,
      };
      final dio = Dio();
      Logger().d(body);
      final response = await dio.post(
        'http://34.194.114.40:8090/api/v1/auth/user/login',
        data: body,
        options: Options(),
      );
      await localDataStorage
          .saveToken('Bearer ${response.data['body']['access_token']}');
      print(response.data['body']['access_token']);

      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> setPassword({
    required String password,
    required String confirmPassword,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {
        'confirmPassword': confirmPassword,
        'password': password,
      };
      Logger().d(body);
      final token = await localDataStorage.getToken();

      final response = await apiRequester.put(
        endpoint: 'setPassword/',
        body: body,
        token: token,
      );

      return response.statusCode == 200;
    } else {
      throw NoInternetException();
    }
  }

  @override
  Future<bool> resendOtpEmail({
    required String email,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {
        'email': email,
      };

      final dio = Dio();
      Logger().d(body);
      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/auth/user/email/resend_otp?email=$email',
        data: body,
        options: Options(),
      );

      return response.statusCode == 200;
    } else {
      throw NoInternetException();
    }
  }

  @override
  Future<bool> confirmOtp({
    required String username,
    required String otp,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {
        'username': username,
        'otp': otp,
      };

      final dio = Dio();
      Logger().d(body);
      final response = await dio.put(
        'http://34.194.114.40:8090/api/v1/auth/user/confirm_otp',
        data: body,
        options: Options(),
      );

      return response.statusCode == 200;
    } else {
      throw NoInternetException();
    }
  }

  @override
  Future<bool> resendOtpSms({required String number}) async {
    if (await networkInfo.isConnected) {
      final body = {
        'phone_number': number,
      };

      final dio = Dio();
      Logger().d(body);
      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/auth/user/sms/resend_otp?phone_number=$number',
        data: body,
        options: Options(),
      );

      return response.statusCode == 200;
    } else {
      throw NoInternetException();
    }
  }

  @override
  Future<bool> updateProfileWithNumber({
    required String email,
    required String fullName,
    required String phoneNumber,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {
        'email': email,
        'full_name': fullName,
      };

      final dio = Dio();
      Logger().d(body);
      final response = await dio.put(
        'http://34.194.114.40:8090/api/v1/auth/user/update_profile/phone/$phoneNumber',
        data: body,
        options: Options(),
      );

      return response.statusCode == 200;
    } else {
      throw NoInternetException();
    }
  }

  @override
  Future<bool> updateProfileWithEmail({
    required String phoneNumber,
    required String email,
    required String fullName,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {
        'phone_number': phoneNumber,
        'full_name': fullName,
      };

      final dio = Dio();
      Logger().d(body);
      final response = await dio.put(
        'http://34.194.114.40:8090/api/v1/auth/user/update_profile/email/$email',
        data: body,
        options: Options(),
      );

      return response.statusCode == 200;
    } else {
      throw NoInternetException();
    }
  }

  @override
  Future<bool> resetPasswordEmail({
    required String email,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {
        'email': email,
      };

      final dio = Dio();
      Logger().d(body);
      final response = await dio.post(
        'http://34.194.114.40:8090/api/v1/auth/user/password_reset/email/$email',
        data: body,
        options: Options(),
      );

      return response.statusCode == 200;
    } else {
      throw NoInternetException();
    }
  }

  @override
  Future<bool> changePasswordEmail({
    required String email,
    required String token,
    required String newPassword,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {
        'email': email,
        'token': token,
        'new_password': newPassword,
      };

      final dio = Dio();
      Logger().d(body);
      final response = await dio.put(
        'http://34.194.114.40:8090/api/v1/auth/user/change_password',
        data: body,
        options: Options(),
      );

      return response.statusCode == 200;
    } else {
      throw NoInternetException();
    }
  }

  @override
  Future<bool> resetPasswordPhoneNumber({
    required String phoneNumber,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {
        'phone': phoneNumber,
      };

      final dio = Dio();
      Logger().d(body);
      final response = await dio.post(
        'http://34.194.114.40:8090/api/v1/auth/user/password_reset/phone/$phoneNumber',
        data: body,
        options: Options(),
      );

      return response.statusCode == 200;
    } else {
      throw NoInternetException();
    }
  }

  @override
  Future<bool> logout() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();
      dio.options.headers['Authorization'] = await localDataStorage.getToken();

      final response = await dio.post(
        'http://34.194.114.40:8090/api/v1/auth/logout',
        options: Options(),
      );
      await localDataStorage.clear();

      return response.statusCode == 200;
    } else {
      throw NoInternetException();
    }
  }
}
