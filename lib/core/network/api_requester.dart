// ignore_for_file: strict_raw_type, inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/constant/network_api_client.dart';

@lazySingleton
class ApiRequester {
  ApiRequester({
    required this.dio,
  });
  final Dio dio;

  Future<Response> post({
    required String endpoint,
    String? token,
    required dynamic body,
    String? contentType,
    bool baseUrl = false,
  }) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['Content-Type'] = 'application/json';

    if (baseUrl) {
      final response = await dio.post(
        endpoint,
        data: body,
        options: Options(
          contentType: contentType,
        ),
      );

      return response;
    } else {
      final response = await dio.post(
        Base_URL + endpoint,
        data: body,
        options: Options(
          contentType: contentType,
        ),
      );

      return response;
    }
  }

  Future<Response> getRequest({
    required String endpoint,
    String? token,
    Map<String, dynamic>? queryParam,
    bool cacheRequest = false,
    dynamic body,
    String? day,
    String? apiKey,
    String? apiId,
  }) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['Content-Type'] = 'application/json';

    final response = dio.get(
      Base_URL + endpoint,
      queryParameters: queryParam,
      data: body,
      options: Options(),
    );
    return response;
  }

  Future<Response> put({
    required String endpoint,
    String? baseUrl,
    String? token,
    required dynamic body,
  }) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['Content-Type'] = 'application/json';

    final response = dio.put(
      Base_URL + endpoint,
      data: body,
    );
    return response;
  }
}
