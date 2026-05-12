import 'package:flutter_base/features/translate/data/datasources/fire_store_service.dart';
import 'package:flutter_base/features/translate/data/models/language_model.dart';
import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';
import 'package:flutter_base/features/translate/domain/repositories/language_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LanguageRepository)
class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageFireStoreService _fireStoreApiService;

  LanguageRepositoryImpl(this._fireStoreApiService);

  @override
  Future<List<LanguageEntity>> getLanguages() async {
    try {
      final List<LanguageModel> response = await _fireStoreApiService
          .getLanguages();

      return response.map((model) => model.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LanguageEntity> addVocabulary(String en, String vi) async {
    try {
      final LanguageModel response = await _fireStoreApiService.addVocabulary(
        en,
        vi,
      );

      return response.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
