import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vlab/core/core.dart';

class VlabSecureStorageService implements StorageInterface {
  final secureBox = FlutterSecureStorage();
  @override
  Future<void> delete({required String key}) async {
    await secureBox.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    secureBox.deleteAll();
  }

  @override
  Future<String?> read({required String key}) async {
    return await secureBox.read(key: key);
  }

  @override
  Future<void> write<T>({required String key, required T value}) async {
    return await secureBox.write(key: key, value: value.toString());
  }

  @override
  Future<void> readAll({required Map<String, String> values}) {
    throw UnimplementedError();
  }
}
