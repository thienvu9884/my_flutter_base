import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';
import 'package:flutter_base/features/translate/domain/repository/language_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LanguagesUseCase {
  final LanguageRepository repository;

  LanguagesUseCase(this.repository);

  Future<List<LanguageEntity>> execute(String category) =>
      repository.getLanguages(category);

  Future<LanguageEntity> addVocabulary({
    required String category,
    required String en,
    required String vi,
  }) => repository.addVocabulary(category: category, en: en, vi: vi);
}
