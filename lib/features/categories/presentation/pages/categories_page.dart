import 'package:flutter/material.dart';
import 'package:flutter_base/core/components/dismissible_background.dart';
import 'package:flutter_base/core/extensions/app_extensions.dart';
import 'package:flutter_base/di.dart';
import 'package:flutter_base/features/categories/domain/entities/category_entity.dart';
import 'package:flutter_base/features/categories/presentation/blocs/category_bloc.dart';
import 'package:flutter_base/features/categories/presentation/components/add_category_dialog.dart';
import 'package:flutter_base/features/categories/presentation/components/delete_category_dialog.dart';
import 'package:flutter_base/features/take_a_test/presentation/blocs/vocabulary_practice_bloc.dart';
import 'package:flutter_base/features/take_a_test/presentation/pages/vocabulary_practice_page.dart';
import 'package:flutter_base/features/translate/presentation/screens/languages_screen.dart';
import 'package:my_core/import.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      di<CategoryBloc>()
        ..add(const CategoryEvent.getCategories()),
      child: const CategoriesPageView(),
    );
  }
}

class CategoriesPageView extends StatefulWidget {
  const CategoriesPageView({super.key});

  @override
  State<CategoriesPageView> createState() => _CategoriesPageViewState();
}

class _CategoriesPageViewState extends State<CategoriesPageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(title: Text(context.translate.category)),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddLanguageDialog(context),
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: BlocBuilder<CategoryBloc, CommonState<List<CategoryEntity>>>(
          builder: (context, state) {
            final posts = state.data ?? [];

            return CommonStateWidget(
              state: state,
              onRetry: () =>
                  context.read<CategoryBloc>().add(
                    const CategoryEvent.getCategories(),
                  ),
              child: ListView.separated(
                itemCount: posts.length,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                itemBuilder: (context, index) {
                  final category = posts[index];

                  return Dismissible(
                    key: Key(category.id),
                    direction: DismissDirection.endToStart,
                    background: const DismissibleBackground(),
                    confirmDismiss: (direction) {
                      return showDialog<bool>(
                        context: context,
                        builder: (dialogContext) =>
                            DeleteCategoryDialog(category: category),
                      );
                    },
                    onDismissed: (direction) {
                      context.read<CategoryBloc>().add(
                        const CategoryEvent.getCategories(),
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ListTile(
                              onTap: () =>
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BlocProvider(
                                            // Tạo Bloc và gọi ngay event started để load data
                                            create: (context) =>
                                            di<VocabularyPracticeBloc>()
                                              ..add(VocabularyPracticeEvent
                                                  .started(category.name)),
                                            child: VocabularyPracticePage(
                                                categoryId: category.name),
                                          ),
                                    ),
                                  ),
                              title: Text(
                                category.name,
                                style: context.appStyle.specialTitle,
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_rounded,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () =>
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      LanguagesScreen(category: category.name),
                                ),
                              ),
                          child: const Icon(Icons.list_alt_rounded, size: 60),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, _) => const SizedBox(height: 8),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showAddLanguageDialog(BuildContext context) {
    final categoryBloc = context.read<CategoryBloc>();

    showDialog(
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: categoryBloc,
          child: const AddCategoryDialog(),
        );
      },
    );
  }
}
