// ignore_for_file: non_constant_identifier_names, one_member_abstracts, inference_failure_on_function_invocation, lines_longer_than_80_chars, avoid_print, avoid_dynamic_calls

import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/local_data/local_data.dart';
import 'package:Foodlify/core/network/network.dart';
import 'package:Foodlify/features/account/data/models/address_list_model.dart';
import 'package:Foodlify/features/account/data/models/delivery_address_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract class AccountRemoteDatasource {
  Future<bool> updateDeliveryAddress({
    required String contact_name,
    required String address,
    required String phone_number,
  });
  Future<List<DeliveryAddressModel>> getDeliveryAddress();
  Future<bool> setDefaultAddress({
    required String address_id,
  });
  Future<bool> editName({
    required String new_name,
  });
  Future<DeliveryAddressModel> getDefaultAddress();
}

@LazySingleton(as: AccountRemoteDatasource)
class AccountRemoteDataSourceImpl extends AccountRemoteDatasource {
  AccountRemoteDataSourceImpl({
    required this.localDataStorage,
    required this.apiRequester,
    required this.networkInfo,
  });
  final LocalDataStorage localDataStorage;
  final ApiRequester apiRequester;
  final NetworkInfo networkInfo;

  @override
  Future<bool> updateDeliveryAddress({
    required String contact_name,
    required String address,
    required String phone_number,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {
        'contact_name': contact_name,
        'address': address,
        'phone_number': phone_number,
      };
      final dio = Dio();

      Logger().d(body);
      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.post(
        'http://34.194.114.40:8090/api/v1/user/delivery_address',
        data: body,
        options: Options(),
      );
      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<DeliveryAddressModel>> getDeliveryAddress() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/user/delivery_address',
        options: Options(),
      );
      final deliveryAddress = AddressListModel.fromJson(
        response.data as Map<String, dynamic>,
      ).body;
      print(response.data);
      return deliveryAddress ?? [];
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> setDefaultAddress({required String address_id}) async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.put(
        'http://34.194.114.40:8090/api/v1/user/set_default_delivery_address/$address_id',
        options: Options(),
      );

      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> editName({required String new_name}) async {
    if (await networkInfo.isConnected) {
      final body = {
        'new_name': new_name,
      };
      final dio = Dio();
      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.put(
        'http://34.194.114.40:8090/api/v1/user/update_name?new_name=$new_name',
        data: body,
        options: Options(),
      );

      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<DeliveryAddressModel> getDefaultAddress() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/user/default_delivery_address',
        options: Options(),
      );

      Logger().d(response);
      return DeliveryAddressModel.fromJson(
        response.data['body'] as Map<String, dynamic>,
      );
    } else {
      throw NoDataException();
    }
  }
}
