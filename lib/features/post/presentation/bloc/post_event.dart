import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_event.freezed.dart';

@freezed
class PostEvent with _$PostEvent {
  const PostEvent._();

  const factory PostEvent.getPosts() = _GetPostsEvent;
}
