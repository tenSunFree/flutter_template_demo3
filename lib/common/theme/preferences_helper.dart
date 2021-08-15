import 'package:flutter_template_demo3/common/util/log_utils.dart';
import 'package:flutter_template_demo3/common/di/get_it.dart';
import 'package:flutter_template_demo3/common/theme/theme_change_notifier.dart';
import 'package:single_item_storage/storage.dart';

class PreferencesHelper {
  late ThemeChangeNotifier themePreferred;

  init() async {
    themePreferred = await _getPreferredTheme();
  }

  Future<void> setIsDarkThemePreferred(bool isDarkThemePreferred) async {
    await getIt
        .get<Storage<bool>>(instanceName: preferredThemeModeKey)
        .save(isDarkThemePreferred);
    themePreferred = isDarkThemePreferred == true
        ? ThemeChangeNotifier.darkTheme()
        : ThemeChangeNotifier.lightTheme();
  }

  Future<ThemeChangeNotifier> _getPreferredTheme() async {
    final bool? storedThemeMode = await getIt
        .get<Storage<bool>>(instanceName: preferredThemeModeKey)
        .get();
    if (storedThemeMode == null) return ThemeChangeNotifier.lightTheme();
    return storedThemeMode == true
        ? ThemeChangeNotifier.darkTheme()
        : ThemeChangeNotifier.lightTheme();
  }
}
