import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';

class PaginatedLanguageResult {
  final List<LanguageEntity> entities;
  final DocumentSnapshot? lastDoc;

  PaginatedLanguageResult(this.entities, this.lastDoc);
}
