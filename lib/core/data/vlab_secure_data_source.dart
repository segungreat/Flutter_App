import 'package:vlab/core/core.dart';

class VlabSecureDataSource {
  StorageInterface fmSecureStorage = VlabSecureStorageService();

  saveToken(String? token) async {
    return await fmSecureStorage.write<String?>(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await fmSecureStorage.read(key: 'token');
  }
}
