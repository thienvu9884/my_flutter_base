import 'package:flutter_base/core/extensions/json_convert.dart';
import 'package:flutter_base/features/take_a_test/domain/entities/vocabulary_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'vocabulary_model.freezed.dart';

part 'vocabulary_model.g.dart';

@freezed
abstract class VocabularyModel with _$VocabularyModel {
  const VocabularyModel._();

  const factory VocabularyModel({
    String? id,
    String? english,
    String? vietnamese,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _VocabularyModel;

  factory VocabularyModel.fromJson(Map<String, dynamic> json) =>
      _$VocabularyModelFromJson(json);

  factory VocabularyModel.toJson(Map<String, dynamic> json) =>
      _$VocabularyModelFromJson(json);

  VocabularyEntity toEntity() {
    return VocabularyEntity(
      id: id ?? '',
      english: english ?? '',
      vietnamese: vietnamese ?? '',
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
