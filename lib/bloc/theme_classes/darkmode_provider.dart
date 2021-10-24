import 'package:flutter/foundation.dart';
import 'package:knowledgebase/local_preference/theme_preference.dart';

class DarkModeSwitcher extends ChangeNotifier {
  bool _isDarkMode = false;

  DarkModeSwitcher() {
    getThemePreference();
  }

  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool value) {
    // debugPrint('lol');
    _isDarkMode = value;
    GetPreferences().updateThemePreference(value);
    notifyListeners();
  }

  getThemePreference() async {
    isDarkMode = await GetPreferences().getThemePreference();
    notifyListeners();
  }
}
