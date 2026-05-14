import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';
import 'package:flutter_base/features/translate/domain/entities/paginated_language_result.dart';

abstract class LanguageRepository {
  Future<PaginatedLanguageResult> getVocabularies(
    String category, {
    DocumentSnapshot? lastDoc,
  });

  Future<LanguageEntity> addVocabulary({
    required String category,
    required String en,
    required String vi,
  });
}
