import 'package:flutter_base/features/post/domain/entities/post_entity.dart';
import 'package:flutter_base/features/post/domain/repositories/post_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPostUseCase {
  final PostRepository repository;

  GetPostUseCase(@Named('firestore') this.repository);

  Future<List<PostEntity>> execute() => repository.getPosts();
}
