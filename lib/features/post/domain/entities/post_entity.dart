import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';

@freezed
abstract class PostEntity with _$PostEntity {
  const PostEntity._();

  const factory PostEntity({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _PostEntity;
}
