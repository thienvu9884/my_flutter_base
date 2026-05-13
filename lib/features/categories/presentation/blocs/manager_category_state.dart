part of 'manager_category_bloc.dart';

@freezed
class ManagerCategoryState with _$ManagerCategoryState {
  const ManagerCategoryState._();

  const factory ManagerCategoryState.initial() = _Initial;

  const factory ManagerCategoryState.adding() = _Adding;

  const factory ManagerCategoryState.deleting() = _Deleting;

  const factory ManagerCategoryState.success(CategoryEntity? category) =
  _Success;

  const factory ManagerCategoryState.failure(String message) = _Failure;
}
