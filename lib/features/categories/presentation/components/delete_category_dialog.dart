import 'package:flutter/material.dart';
import 'package:flutter_base/di.dart';
import 'package:flutter_base/features/categories/domain/entities/category_entity.dart';
import 'package:flutter_base/features/categories/presentation/blocs/manager_category_bloc.dart';
import 'package:my_core/import.dart';

class DeleteCategoryDialog extends StatelessWidget {
  final CategoryEntity category;

  const DeleteCategoryDialog({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ManagerCategoryBloc>(),
      child: AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: Text(
          'Bạn có chắc chắn muốn xóa danh mục "${category.name}" không?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Hủy'),
          ),
          BlocBuilder<ManagerCategoryBloc, ManagerCategoryState>(
            builder: (context, state) {
              return TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                onPressed: () {
                  context.read<ManagerCategoryBloc>().add(
                    ManagerCategoryEvent.deleteCategory(
                      name: category.name,
                      id: category.id,
                    ),
                  );
                  Navigator.of(context).pop(true);
                },
                child: const Text('Xóa'),
              );
            },
          ),
        ],
      ),
    );
  }
}
