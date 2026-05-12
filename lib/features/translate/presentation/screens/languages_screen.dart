import 'package:flutter/material.dart';
import 'package:flutter_base/core/cubit/locale/locale_cubit.dart';
import 'package:flutter_base/core/cubit/theme/theme_cubit.dart';
import 'package:flutter_base/di.dart';
import 'package:flutter_base/core/extensions/app_extensions.dart';
import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';
import 'package:flutter_base/features/translate/presentation/bloc/languages_bloc.dart';
import 'package:flutter_base/features/translate/presentation/bloc/languages_event.dart';
import 'package:flutter_base/features/translate/presentation/manager_vocabulary_bloc/manager_vocabulary_bloc.dart';
import 'package:my_core/import.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          di<LanguagesBloc>()..add(const LanguagesEvent.getLanguages()),
      child: const PostView(),
    );
  }
}

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate.posts),
        actions: [
          IconButton(
            onPressed: () => di<ThemeCubit>().toggleTheme(),
            icon: context.watch<ThemeCubit>().state == ThemeMode.dark
                ? Icon(Icons.light_mode)
                : Icon(Icons.dark_mode),
          ),
          IconButton(
            onPressed: () => di<LocaleCubit>().changeLocale(),
            icon: Icon(Icons.language_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddLanguageDialog(context),
      ),
      body: BlocBuilder<LanguagesBloc, CommonState<List<LanguageEntity>>>(
        builder: (context, state) {
          final posts = state.data ?? [];

          return CommonStateWidget(
            state: state,
            onRetry: () => context.read<LanguagesBloc>().add(
              const LanguagesEvent.getLanguages(),
            ),
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(
                    post.english,
                    style: context.appStyle.specialTitle,
                  ),
                  subtitle: Text(
                    post.vietnamese,
                    style: context.appStyle.labelSmall,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showAddLanguageDialog(BuildContext context) {
    final englishController = TextEditingController();
    final vietnameseController = TextEditingController();
    final languageBloc = context.read<LanguagesBloc>();

    showDialog(
      context: context,
      builder: (context) {
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
                      languageBloc.add(const LanguagesEvent.getLanguages());

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
                          ManagerVocabularyEvent.addVocabulary(en: eng, vi: vi),
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
      },
    );
  }
}
