import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';

abstract class LanguageRepository {
  Future<List<LanguageEntity>> getLanguages();

  Future<LanguageEntity> addVocabulary(String en, String vi);
}
