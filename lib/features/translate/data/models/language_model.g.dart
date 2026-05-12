// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) =>
    _LanguageModel(
      id: json['id'] as String?,
      english: json['english'] as String?,
      vietnamese: json['vietnamese'] as String?,
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['createdAt'],
        const TimestampConverter().fromJson,
      ),
      updatedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['updatedAt'],
        const TimestampConverter().fromJson,
      ),
    );

Map<String, dynamic> _$LanguageModelToJson(_LanguageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'english': instance.english,
      'vietnamese': instance.vietnamese,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
        instance.createdAt,
        const TimestampConverter().toJson,
      ),
      'updatedAt': _$JsonConverterToJson<Timestamp, DateTime>(
        instance.updatedAt,
        const TimestampConverter().toJson,
      ),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
