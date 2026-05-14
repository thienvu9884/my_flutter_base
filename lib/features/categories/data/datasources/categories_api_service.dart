import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base/features/categories/data/dtoes/category_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CategoriesApiService {
  final FirebaseFirestore _firestore;

  CategoriesApiService(this._firestore);

  Future<List<CategoryModel>> getCategories() async {
    final vocabularies = await _firestore
        .collection('collections')
        .limit(20)
        .get();
    return vocabularies.docs
        .map((doc) => CategoryModel.fromJson(doc.data()))
        .toList();
  }

  Future<CategoryModel> addCategory(String name) async {
    final now = DateTime.now();
    final collection = _firestore.collection('collections');
    final docRef = collection.doc();
    await docRef.set(
      CategoryModel(id: docRef.id, name: name, createdAt: now).toJson(),
    );
    return CategoryModel(id: docRef.id, name: name, createdAt: now);
  }

  Future<void> deleteCategory(String name, String id) async {
    await _deleteCollectionInBatches(name);

    // 2. Sau đó xóa document định danh trong collection 'collections'
    // ĐẶT Ở ĐÂY:
    await _firestore.collection('collections').doc(id).delete();
  }

  Future<void> _deleteCollectionInBatches(String collectionPath) async {
    final collection = _firestore.collection(collectionPath);
    final snapshots = await collection.get();
    final docs = snapshots.docs;

    // --- ĐẶT TẠI ĐÂY ---
    // Nếu collection trống, thoát hàm ngay lập tức
    if (docs.isEmpty) return;
    // -------------------

    const int batchSize = 400;

    for (var i = 0; i < docs.length; i += batchSize) {
      final batch = FirebaseFirestore.instance.batch();

      final chunk = docs.sublist(
        i,
        (i + batchSize > docs.length) ? docs.length : i + batchSize,
      );

      for (var doc in chunk) {
        batch.delete(doc.reference);
      }

      await batch.commit();
    }
  }
}
