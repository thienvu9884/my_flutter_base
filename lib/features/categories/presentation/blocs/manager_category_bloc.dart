import 'package:flutter_base/features/categories/domain/entities/category_entity.dart';
import 'package:flutter_base/features/categories/domain/usecases/category_use_cases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_core/import.dart';

part 'manager_category_event.dart';

part 'manager_category_state.dart';

part 'manager_category_bloc.freezed.dart';

@injectable
class ManagerCategoryBloc
    extends Bloc<ManagerCategoryEvent, ManagerCategoryState> {
  final CategoryUseCase _categoryUseCase;

  ManagerCategoryBloc(this._categoryUseCase)
    : super(const ManagerCategoryState.initial()) {
    on<ManagerCategoryEvent>((event, emit) async {
      await event.when(
        addCategory: (String name) async {
          emit(const ManagerCategoryState.adding());

          try {
            final language = await _categoryUseCase.addCategory(name);

            emit(ManagerCategoryState.success(language));
          } catch (e) {
            emit(ManagerCategoryState.failure(e.toString()));
          }
        },
        deleteCategory: (String name, String id) async {
          emit(const ManagerCategoryState.deleting());

          try {
            await _categoryUseCase.deleteCategory(name, id);

            emit(const ManagerCategoryState.success(null));
          } catch (e) {
            emit(ManagerCategoryState.failure(e.toString()));
          }
        },
      );
    });
  }
}
