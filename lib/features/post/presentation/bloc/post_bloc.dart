import 'package:flutter_base/features/post/domain/entities/post_entity.dart';
import 'package:flutter_base/features/post/domain/usecases/get_post_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:my_core/import.dart';

import 'post_event.dart';

@injectable
class PostBloc extends BaseBloc<PostEvent, CommonState<List<PostEntity>>> {
  final GetPostUseCase _getPostsUseCase;

  PostBloc(this._getPostsUseCase) : super(const CommonState.initial()) {
    on<PostEvent>((event, emit) async {
      await event.when(
        getPosts: () async {
          emit(CommonState.loading());

          try {
            final result = await _getPostsUseCase.execute();
            emit(CommonState.success(result));
          } catch (e) {
            emit(CommonState.failure(e.toString()));
          }
        },
      );
    });
  }
}
