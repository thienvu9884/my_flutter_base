import 'package:flutter_base/features/post/data/datasources/fire_store_service.dart';
import 'package:flutter_base/features/post/data/models/post_model.dart';
import 'package:flutter_base/features/post/domain/entities/post_entity.dart';
import 'package:flutter_base/features/post/domain/repositories/post_repository.dart';
import 'package:injectable/injectable.dart';

import '../datasources/api_service.dart';

@Named('retrofit')
@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final ApiService _apiService;

  PostRepositoryImpl(this._apiService);

  @override
  Future<List<PostEntity>> getPosts() async {
    try {
      final List<PostModel> response = await _apiService.getPosts();

      return response.map((model) => model.toEntity()).toList();
    } catch (e) {
      // Tại đây bạn có thể handle thêm các lỗi cụ thể từ Dio (401, 404, 500...)
      rethrow;
    }
  }
}

@Named('firestore')
@LazySingleton(as: PostRepository)
class PostRepositoryWithFireStoreImpl implements PostRepository {
  final FireStoreApiService _fireStoreApiService;

  PostRepositoryWithFireStoreImpl(this._fireStoreApiService);

  @override
  Future<List<PostEntity>> getPosts() async {
    try {
      final List<PostModel> response = await _fireStoreApiService.getPosts();

      return response.map((model) => model.toEntity()).toList();
    } catch (e) {
      // Tại đây bạn có thể handle thêm các lỗi cụ thể từ Dio (401, 404, 500...)
      rethrow;
    }
  }
}
