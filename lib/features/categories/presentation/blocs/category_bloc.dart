import 'package:flutter_base/features/categories/domain/entities/category_entity.dart';
import 'package:flutter_base/features/categories/domain/usecases/category_use_cases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_core/import.dart';

part 'category_event.dart';

part 'category_bloc.freezed.dart';

@injectable
class CategoryBloc
    extends Bloc<CategoryEvent, CommonState<List<CategoryEntity>>> {
  final CategoryUseCase _categoryUseCase;

  CategoryBloc(this._categoryUseCase) : super(const CommonState.initial()) {
    on<CategoryEvent>((event, emit) async {
      await event.when(
        getCategories: () async {
          emit(const CommonState.loading());

          try {
            final result = await _categoryUseCase.execute();
            emit(CommonState.success(result));
          } catch (e) {
            emit(CommonState.failure(e.toString()));
          }
        },
      );
    });
  }
}
