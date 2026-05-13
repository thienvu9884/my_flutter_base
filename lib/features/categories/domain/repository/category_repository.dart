import 'package:flutter_base/features/categories/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategories();

  Future<CategoryEntity> addCategory(String name);

  Future<void> deleteCategory(String name, String id);
}
