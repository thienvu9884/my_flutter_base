import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_entity.freezed.dart';

@freezed
abstract class LanguageEntity with _$LanguageEntity {
  const LanguageEntity._();

  const factory LanguageEntity({
    required String id,
    required String english,
    required String vietnamese,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _LanguageEntity;
}
