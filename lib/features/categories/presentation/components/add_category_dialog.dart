import 'package:flutter/material.dart';
import 'package:flutter_base/di.dart';
import 'package:flutter_base/features/categories/presentation/blocs/category_bloc.dart';
import 'package:flutter_base/features/categories/presentation/blocs/manager_category_bloc.dart';
import 'package:my_core/import.dart';

class AddCategoryDialog extends StatelessWidget {
  const AddCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = TextEditingController();
    final categoryBloc = context.read<CategoryBloc>();

    return BlocProvider(
      create: (context) => di<ManagerCategoryBloc>(),
      child: AlertDialog(
        title: const Text('Thêm danh mục mới'),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Để popup gọn theo nội dung
          children: [
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(
                labelText: 'Danh mục',
                hintText: 'Nhập danh mục...',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          BlocConsumer<ManagerCategoryBloc, ManagerCategoryState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (_) {
                  categoryBloc.add(const CategoryEvent.getCategories());

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Thêm thành công!')),
                  );
                },
              );
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  final name = categoryController.text.trim();

                  if (name.isNotEmpty) {
                    context.read<ManagerCategoryBloc>().add(
                      ManagerCategoryEvent.addCategory(name: name),
                    );
                  }
                },
                child: state.maybeWhen(
                  adding: () => const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  orElse: () => const Text('Thêm'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
