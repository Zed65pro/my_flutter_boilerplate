import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() {
    return _instance;
  }

  LocalStorage._internal();

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


/// *** *** *** *** *** Example *** *** *** *** *** ///

// LocalStorage localStorage = LocalStorage();
//
// // Save data
// localStorage.saveData('username', 'JohnDoe');
//
// // Read data
// String? username = localStorage.readData<String>('username');
// print('Username: $username'); // Output: Username: JohnDoe
//
// // Remove data
// localStorage.removeData('username');
//
// // Clear all data
// localStorage.clearAll();

