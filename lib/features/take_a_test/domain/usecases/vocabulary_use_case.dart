import 'package:dartz/dartz.dart';
import 'package:flutter_base/features/take_a_test/domain/entities/failure.dart';
import 'package:flutter_base/features/take_a_test/domain/entities/vocabulary_entity.dart';
import 'package:flutter_base/features/take_a_test/domain/repository/vocabulary_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class VocabulariesUseCase {
  final VocabularyRepository repository;

  VocabulariesUseCase(this.repository);

  Future<Either<Failure, List<VocabularyEntity>>> execute(String category) =>
      repository.getVocabularies(category);
}
