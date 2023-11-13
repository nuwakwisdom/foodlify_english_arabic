import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class RegisterModule {
  Dio get dio => Dio();
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();
  DeviceInfoPlugin get deviceInfoPlugin => DeviceInfoPlugin();
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
}
