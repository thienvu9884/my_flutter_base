import 'package:flutter_base/core/extensions/json_convert.dart';
import 'package:flutter_base/features/categories/domain/entities/category_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'category_model.freezed.dart';

part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const CategoryModel._();

  const factory CategoryModel({
    String? id,
    String? name,
    @TimestampConverter() DateTime? createdAt,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  factory CategoryModel.toJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id ?? '',
      name: name ?? '',
      createdAt: createdAt,
    );
  }
}
