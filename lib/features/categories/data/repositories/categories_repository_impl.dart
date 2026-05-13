import 'package:flutter_base/features/categories/data/datasources/categories_api_service.dart';
import 'package:flutter_base/features/categories/data/dtoes/category_model.dart';
import 'package:flutter_base/features/categories/domain/entities/category_entity.dart';
import 'package:flutter_base/features/categories/domain/repository/category_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoryRepository)
class CategoriesRepositoryImpl implements CategoryRepository {
  final CategoriesApiService _categoriesApiService;

  CategoriesRepositoryImpl(this._categoriesApiService);

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final List<CategoryModel> response = await _categoriesApiService
          .getCategories();

      return response.map((model) => model.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CategoryEntity> addCategory(String name) async {
    try {
      final CategoryModel response = await _categoriesApiService.addCategory(
        name,
      );

      return response.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteCategory(String name, String id) async {
    try {
      await _categoriesApiService.deleteCategory(name, id);
    } catch (e) {
      rethrow;
    }
  }
}
