import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';
import 'package:flutter_base/features/translate/domain/repositories/language_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LanguagesUseCase {
  final LanguageRepository repository;

  LanguagesUseCase(this.repository);

  Future<List<LanguageEntity>> execute() => repository.getLanguages();

  Future<LanguageEntity> addVocabulary(String en, String vi) =>
      repository.addVocabulary(en, vi);
}
