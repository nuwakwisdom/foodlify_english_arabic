import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDataStorage {
  Future<String?> getToken();
  Future<String?> getUserId();
  Future<void> saveToken(String token);

  Future<String?> getRefreshToken();
  Future<void> saveRefreshToken(String token);
  Future<void> saveUserid(String userJson);
  Future<void> clear();
}

@LazySingleton(as: LocalDataStorage)
class LocalDataStorageImpl implements LocalDataStorage {
  LocalDataStorageImpl(this.storage);

  final FlutterSecureStorage storage;
  @override
  Future<void> clear() async {
    await storage.deleteAll();
  }

  @override
  Future<String?> getToken() async {
    return storage.read(key: accessToken);
  }

  @override
  Future<String?> getRefreshToken() {
    return storage.read(key: refreshToken);
  }

  @override
  Future<String?> getUserId() {
    return storage.read(
      key: userData,
    );
  }

  @override
  Future<void> saveToken(String token) {
    return storage.write(key: accessToken, value: token);
  }

  @override
  Future<void> saveRefreshToken(String token) {
    return storage.write(key: refreshToken, value: token);
  }

  @override
  Future<void> saveUserid(String userJson) {
    return storage.write(key: userData, value: userJson);
  }
}

const String accessToken = 'access_token';
const String refreshToken = 'refreshToken';
const String userData = 'userData';
