import 'package:flutter_base/features/translate/data/datasources/fire_store_service.dart';
import 'package:flutter_base/features/translate/data/models/language_model.dart';
import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';
import 'package:flutter_base/features/translate/domain/repository/language_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LanguageRepository)
class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageFireStoreService _fireStoreApiService;

  LanguageRepositoryImpl(this._fireStoreApiService);

  @override
  Future<List<LanguageEntity>> getLanguages(String category) async {
    try {
      final List<LanguageModel> response = await _fireStoreApiService
          .getLanguages(category);

      return response.map((model) => model.toEntity()).toList();
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
