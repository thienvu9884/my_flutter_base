import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:my_core/import.dart';

@lazySingleton
class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('vi'));

  void changeLocale(String languageCode) {
    emit(Locale(languageCode));
  }
}
