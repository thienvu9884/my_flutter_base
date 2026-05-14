import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base/features/take_a_test/data/models/vocabulary_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LanguageFireStoreService {
  final FirebaseFirestore _firestore;

  LanguageFireStoreService(this._firestore);

  Future<List<VocabularyModel>> getLanguages(String category) async {
    final vocabularies = await _firestore.collection(category).get();
    return vocabularies.docs
        .map((doc) => VocabularyModel.fromJson(doc.data()))
        .toList();
  }
}
