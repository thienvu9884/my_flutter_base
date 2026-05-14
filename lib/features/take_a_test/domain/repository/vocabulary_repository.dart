import 'package:dartz/dartz.dart';
import 'package:flutter_base/features/take_a_test/domain/entities/failure.dart';
import 'package:flutter_base/features/take_a_test/domain/entities/vocabulary_entity.dart';

abstract class VocabularyRepository {
  Future<Either<Failure, List<VocabularyEntity>>> getVocabularies(String category);
}
