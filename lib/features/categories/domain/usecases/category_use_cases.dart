import 'package:flutter_base/features/categories/domain/entities/category_entity.dart';
import 'package:flutter_base/features/categories/domain/repository/category_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CategoryUseCase {
  final CategoryRepository repository;

  CategoryUseCase(this.repository);

  Future<List<CategoryEntity>> execute() => repository.getCategories();

  Future<CategoryEntity> addCategory(String name) =>
      repository.addCategory(name);

  Future<void> deleteCategory(String name, String id) =>
      repository.deleteCategory(name, id);
}
