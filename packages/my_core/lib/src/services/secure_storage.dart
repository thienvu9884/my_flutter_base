import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class IStorageService {
  Future<void> write(String key, String value);
  Future<String?> read(String key);
  Future<void> delete(String key);
  Future<void> clearAll();
}

@LazySingleton(as: IStorageService)
class StorageService implements IStorageService {
  final FlutterSecureStorage _storage;

  // Sử dụng Singleton pattern hoặc Inject qua Constructor
  StorageService(this._storage);

  @override
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  @override
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}