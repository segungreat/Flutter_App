import 'package:get_storage/get_storage.dart';
import 'package:vlab/core/core.dart';

class VlabFastStorageService implements StorageInterface {
  final box = GetStorage();

  @override
  Future<void> delete({required String key}) async {
    await box.remove(key);
  }

  @override
  Future<void> deleteAll() async {
    box.erase();
  }

  @override
  read({required String key}) {
    return box.read(key);
  }

  @override
  Future<void> readAll({required Map<String, String> values}) {
    return box.getValues();
  }

  @override
  Future<void> write<T>({required String key, required T value}) async {
    box.write(key, value);
  }
}
