import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const _key = 'theme_mode';
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  Future<void> load() async {
    final sp = await SharedPreferences.getInstance();
    final v = sp.getString(_key);
    _themeMode = _fromString(v);
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_key, _toString(mode));
  }

  String _toString(ThemeMode m) => m == ThemeMode.light
      ? 'light'
      : m == ThemeMode.dark
      ? 'dark'
      : 'system';
  ThemeMode _fromString(String? v) {
    switch (v) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
