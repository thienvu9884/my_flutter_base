import 'package:flutter/material.dart';
import 'package:flutter_base/di.dart';
import 'package:flutter_base/features/translate/presentation/bloc/languages_bloc.dart';
import 'package:flutter_base/features/translate/presentation/bloc/languages_event.dart';
import 'package:flutter_base/features/translate/presentation/bloc/manager_vocabulary_bloc.dart';
import 'package:my_core/import.dart';

class AddVocabularyDialog extends StatelessWidget {
  final String category;

  const AddVocabularyDialog({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final englishController = TextEditingController();
    final vietnameseController = TextEditingController();
    final languageBloc = context.read<LanguagesBloc>();

    return BlocProvider(
      create: (context) => di<ManagerVocabularyBloc>(),
      child: AlertDialog(
        title: const Text('Thêm ngôn ngữ mới'),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Để popup gọn theo nội dung
          children: [
            TextField(
              controller: englishController,
              decoration: const InputDecoration(
                labelText: 'Tiếng Anh',
                hintText: 'Nhập từ tiếng Anh...',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: vietnameseController,
              decoration: const InputDecoration(
                labelText: 'Tiếng Việt',
                hintText: 'Nhập nghĩa tiếng Việt...',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          BlocConsumer<ManagerVocabularyBloc, ManagerVocabularyState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (_) {
                  languageBloc.add(
                    LanguagesEvent.getLanguages(category: category),
                  );

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
                  final eng = englishController.text.trim();
                  final vi = vietnameseController.text.trim();

                  if (eng.isNotEmpty && vi.isNotEmpty) {
                    context.read<ManagerVocabularyBloc>().add(
                      ManagerVocabularyEvent.addVocabulary(
                        category: category,
                        en: eng,
                        vi: vi,
                      ),
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
