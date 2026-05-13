part of 'manager_category_bloc.dart';

@freezed
abstract class ManagerCategoryEvent with _$ManagerCategoryEvent {
  const ManagerCategoryEvent._();

  const factory ManagerCategoryEvent.addCategory({required String name}) =
      _AddCategory;

  const factory ManagerCategoryEvent.deleteCategory({
    required String name,
    required String id,
  }) = _DeleteCategory;
}
