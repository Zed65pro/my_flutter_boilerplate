import 'package:get_storage/get_storage.dart';

// SINGLETON CLASS
class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();
  factory LocalStorage() => _instance;
  LocalStorage._internal();


  Future<void> initGetStorage() async {
    await GetStorage.init();
  }

  final _storage = GetStorage();

  Future<void> write<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  T? read<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> delete(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}
