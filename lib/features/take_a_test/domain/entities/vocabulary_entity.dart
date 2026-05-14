import 'package:freezed_annotation/freezed_annotation.dart';

part 'vocabulary_entity.freezed.dart';

@freezed
abstract class VocabularyEntity with _$VocabularyEntity {
  const VocabularyEntity._();

  const factory VocabularyEntity({
    required String id,
    required String english,
    required String vietnamese,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VocabularyEntity;
}
