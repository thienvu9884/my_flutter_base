import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:my_core/import.dart';

@lazySingleton
class LocaleCubit extends Cubit<Locale> {
  final IStorageService _storageService;
  static const _localeKey = 'user_local_language';

  LocaleCubit(this._storageService) : super(const Locale('vi')) {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final languageCode = await _storageService.read(_localeKey);
    if (languageCode == 'vi') {
      emit(Locale('vi'));
    } else if (languageCode == 'en') {
      emit(Locale('en'));
    }
  }

  Future<void> changeLocale() async {
    Locale locale;

    if (state == Locale('vi')) {
      locale = Locale('en');
    } else {
      locale = Locale('vi');
    }

    emit(locale);
    await _storageService.write(_localeKey, locale.languageCode);
  }
}
