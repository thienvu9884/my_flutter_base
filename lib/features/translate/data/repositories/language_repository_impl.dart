import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base/features/translate/data/datasources/fire_store_service.dart';
import 'package:flutter_base/features/translate/data/models/language_model.dart';
import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';
import 'package:flutter_base/features/translate/domain/entities/paginated_language_result.dart';
import 'package:flutter_base/features/translate/domain/repository/language_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LanguageRepository)
class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageFireStoreService _fireStoreApiService;

  LanguageRepositoryImpl(this._fireStoreApiService);

  @override
  Future<PaginatedLanguageResult> getVocabularies(
    String category, {
    DocumentSnapshot? lastDoc,
  }) async {
    try {
      // Gọi service với lastDoc
      final response = await _fireStoreApiService.getVocabularies(
        category,
        lastDoc: lastDoc,
      );

      final entities = response.items.map((model) => model.toEntity()).toList();

      return PaginatedLanguageResult(entities, response.lastDoc);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LanguageEntity> addVocabulary({
    required String category,
    required String en,
    required String vi,
  }) async {
    try {
      final LanguageModel response = await _fireStoreApiService.addVocabulary(
        category: category,
        en: en,
        vi: vi,
      );

      return response.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
