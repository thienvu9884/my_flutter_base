import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_core/import.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeMode> {
  final IStorageService _storageService;
  static const _themeKey = 'user_theme_mode';

  ThemeCubit(this._storageService) : super(ThemeMode.system) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final savedTheme = await _storageService.read(_themeKey);
    if (savedTheme == 'light') {
      emit(ThemeMode.light);
    } else if (savedTheme == 'dark') {
      emit(ThemeMode.dark);
    }
  }

  Future<void> toggleTheme() async {
    ThemeMode nextMode;

    if (state == ThemeMode.system) {
      final brightness = PlatformDispatcher.instance.platformBrightness;
      if (brightness == Brightness.light) {
        nextMode = ThemeMode.dark;
      } else {
        nextMode = ThemeMode.light;
      }
    } else if (state == ThemeMode.light) {
      nextMode = ThemeMode.dark;
    } else {
      nextMode = ThemeMode.light;
    }

    emit(nextMode);
    await _storageService.write(_themeKey, nextMode.name);
  }
}
