import '../../core.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final VlabLocalDataSource _localDataSource;
  ThemeNotifier(this._localDataSource) : super(ThemeMode.light) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final isDark = _localDataSource.getCurrentThemeMode() ?? false;

    state = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() async {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    _localDataSource.saveThemeModeBoolean(state == ThemeMode.dark);
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(VlabLocalDataSource()),
);
