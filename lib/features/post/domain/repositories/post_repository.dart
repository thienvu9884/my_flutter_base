import 'package:flutter_base/features/post/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getPosts();
}
