import 'package:flutter/material.dart';
import 'package:flutter_base/core/cubit/locale/locale_cubit.dart';
import 'package:flutter_base/core/cubit/theme/theme_cubit.dart';
import 'package:flutter_base/di.dart';
import 'package:flutter_base/core/extensions/app_extensions.dart';
import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';
import 'package:flutter_base/features/translate/presentation/bloc/languages_bloc.dart';
import 'package:flutter_base/features/translate/presentation/bloc/languages_event.dart';
import 'package:flutter_base/features/translate/presentation/components/add_vocabulary_dialog.dart';
import 'package:my_core/import.dart';

class LanguagesScreen extends StatelessWidget {
  final String category;

  const LanguagesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          di<LanguagesBloc>()
            ..add(LanguagesEvent.getLanguages(category: category)),
      child: PostView(category: category),
    );
  }
}

class PostView extends StatefulWidget {
  final String category;

  const PostView({super.key, required this.category});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final _scrollController = ScrollController();

  void _onScroll() {
    final state = context.read<LanguagesBloc>().state;

    // RẤT QUAN TRỌNG: Phải check isLoadMore và hasReachedMax ở đây
    state.maybeWhen(
      success: (data, isLoadMore, hasReachedMax, lastDoc) {
        if (!isLoadMore && !hasReachedMax) {
          if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent * 0.9) {
            context.read<LanguagesBloc>().add(
              LanguagesEvent.getLanguages(category: widget.category),
            );
          }
        }
      },
      orElse: () {},
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.category),
          actions: [
            IconButton(
              onPressed: () => di<ThemeCubit>().toggleTheme(),
              icon: context.watch<ThemeCubit>().state == ThemeMode.dark
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
            ),
            IconButton(
              onPressed: () => di<LocaleCubit>().changeLocale(),
              icon: const Icon(Icons.language_rounded),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddLanguageDialog(context),
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: BlocBuilder<LanguagesBloc, CommonState<List<LanguageEntity>>>(
          builder: (context, state) {
            final vocabulary = state.data ?? [];

            return CommonStateWidget(
              state: state,
              onRetry: () => context.read<LanguagesBloc>().add(
                LanguagesEvent.getLanguages(category: widget.category),
              ),
              child: state.maybeWhen(
                success: (data, isLoadMore, hasReachedMax, lastDoc) {
                  return ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                    // Nếu chưa hết dữ liệu, cộng 1 để hiện loading bar ở cuối
                    itemCount: hasReachedMax ? data.length : data.length + 1,
                    itemBuilder: (context, index) {
                      if (index < data.length) {
                        final post = vocabulary[index];

                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            title: Text(
                              post.english,
                              style: context.appStyle.specialTitle,
                            ),
                            subtitle: Text(
                              post.vietnamese,
                              style: context.appStyle.labelSmall,
                            ),
                          ),
                        );
                      } else {
                        // Chỉ hiện vòng quay nhỏ khi thực sự đang load thêm
                        // Nếu không load (đang chờ user cuộn), trả về SizedBox
                        return isLoadMore
                            ? const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : const SizedBox.shrink();
                      }
                    },
                    separatorBuilder: (_, _) => const SizedBox(height: 8),
                  );
                },
                orElse: () => const SizedBox.shrink(),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showAddLanguageDialog(BuildContext context) {
    final languageBloc = context.read<LanguagesBloc>();

    showDialog(
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: languageBloc,
          child: AddVocabularyDialog(
            category: widget.category,
          ),
        );
      },
    );
  }
}
