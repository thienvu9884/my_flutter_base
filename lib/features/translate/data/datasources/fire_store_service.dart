import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base/core/dtoes/paginated_result.dart';
import 'package:flutter_base/features/translate/data/models/language_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LanguageFireStoreService {
  final FirebaseFirestore _firestore;

  LanguageFireStoreService(this._firestore);

  Future<PaginatedResult<LanguageModel>> getVocabularies(
    String category, {
    DocumentSnapshot? lastDoc,
    int limit = 20,
  }) async {
    // 1. Tạo query cơ bản
    Query query = _firestore
        .collection(category)
        .orderBy('createdAt') // Bắt buộc phải orderBy khi làm Pagination
        .limit(limit);

    // 2. Nếu có bản ghi cuối của trang trước, thì bắt đầu sau bản ghi đó
    if (lastDoc != null) {
      query = query.startAfterDocument(lastDoc);
    }

    final snapshot = await query.get();

    final items = snapshot.docs
        .map(
          (doc) => LanguageModel.fromJson(doc.data() as Map<String, dynamic>),
        )
        .toList();

    // 3. Trả về cả list data và cái doc cuối cùng của đợt này
    return PaginatedResult(
      items: items,
      lastDoc: snapshot.docs.isNotEmpty ? snapshot.docs.last : null,
    );
  }

  Future<LanguageModel> addVocabulary({
    required String category,
    required String en,
    required String vi,
  }) async {
    final now = DateTime.now();
    final collection = _firestore.collection(category);
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
