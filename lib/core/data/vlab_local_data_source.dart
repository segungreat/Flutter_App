import '../core.dart';

class VlabLocalDataSource {
  StorageInterface localDataSource = VlabFastStorageService();

  saveThemeModeBoolean(bool isDark) {
    localDataSource.write<bool>(key: 'currentTheme', value: isDark);
  }

  bool? getCurrentThemeMode() {
    return localDataSource.read(key: 'currentTheme');
  }
}
