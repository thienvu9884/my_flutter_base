import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base/features/post/data/models/post_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
 class FireStoreApiService {
  final FirebaseFirestore _firestore;

  FireStoreApiService(this._firestore);

  Future<List<PostModel>> getPosts() async {
    final snapshot = await _firestore.collection('posts').limit(20).get();
    return snapshot.docs.map((doc) => PostModel.fromJson(doc.data())).toList();
  }
}
