import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';

abstract class LanguageRepository {
  Future<List<LanguageEntity>> getLanguages(String category);

  Future<LanguageEntity> addVocabulary({
    required String category,
    required String en,
    required String vi,
  });
}
