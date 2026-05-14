import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';
import 'package:flutter_base/features/translate/domain/entities/paginated_language_result.dart';
import 'package:flutter_base/features/translate/domain/repository/language_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LanguagesUseCase {
  final LanguageRepository repository;

  LanguagesUseCase(this.repository);

  Future<PaginatedLanguageResult> execute(
    String category, {
    DocumentSnapshot? lastDoc,
  }) => repository.getVocabularies(category, lastDoc: lastDoc);

  Future<LanguageEntity> addVocabulary({
    required String category,
    required String en,
    required String vi,
  }) => repository.addVocabulary(category: category, en: en, vi: vi);
}
