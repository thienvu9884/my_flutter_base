import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base/features/translate/data/models/language_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LanguageFireStoreService {
  final FirebaseFirestore _firestore;

  LanguageFireStoreService(this._firestore);

  Future<List<LanguageModel>> getLanguages() async {
    final vocabularies = await _firestore
        .collection('languages')
        .limit(20)
        .get();
    return vocabularies.docs
        .map((doc) => LanguageModel.fromJson(doc.data()))
        .toList();
  }

  Future<LanguageModel> addVocabulary(String en, String vi) async {
    final now = DateTime.now();
    final collection = _firestore.collection('languages');
    final docRef = collection.doc();
    await docRef.set(
      LanguageModel(
        id: docRef.id,
        english: en,
        vietnamese: vi,
        createdAt: now,
        updatedAt: now,
      ).toJson(),
    );
    return LanguageModel(
      id: docRef.id,
      english: en,
      vietnamese: vi,
      createdAt: now,
      updatedAt: now,
    );
  }
}
