import 'package:dartz/dartz.dart';
import 'package:flutter_base/features/take_a_test/data/datasources/fire_store_service.dart';
import 'package:flutter_base/features/take_a_test/data/models/vocabulary_model.dart';
import 'package:flutter_base/features/take_a_test/domain/entities/failure.dart';
import 'package:flutter_base/features/take_a_test/domain/entities/vocabulary_entity.dart';
import 'package:flutter_base/features/take_a_test/domain/repository/vocabulary_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: VocabularyRepository)
class VocabularyRepositoryImpl implements VocabularyRepository {
  final LanguageFireStoreService _fireStoreApiService;

  VocabularyRepositoryImpl(this._fireStoreApiService);

  @override
  Future<Either<Failure, List<VocabularyEntity>>> getVocabularies(
    String category,
  ) async {
    try {
      final List<VocabularyModel> response = await _fireStoreApiService
          .getLanguages(category);

      // Explicitly casting or ensuring the map completes before returning
      final List<VocabularyEntity> entities = response
          .map((model) => model.toEntity())
          .toList();

      return Right(entities);
    } catch (e) {
      rethrow;
    }
  }
}
