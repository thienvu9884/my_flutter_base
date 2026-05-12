import 'package:flutter_base/core/extensions/json_convert.dart';
import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'language_model.freezed.dart';

part 'language_model.g.dart';

@freezed
abstract class LanguageModel with _$LanguageModel {
  const LanguageModel._();

  const factory LanguageModel({
    String? id,
    String? english,
    String? vietnamese,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
  }) = _LanguageModel;

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);

  factory LanguageModel.toJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);

  LanguageEntity toEntity() {
    return LanguageEntity(
      id: id ?? '',
      english: english ?? '',
      vietnamese: vietnamese ?? '',
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
