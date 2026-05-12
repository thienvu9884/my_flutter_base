import 'package:flutter/material.dart';
import 'package:flutter_base/core/cubit/locale/locale_cubit.dart';
import 'package:flutter_base/core/cubit/theme/theme_cubit.dart';
import 'package:flutter_base/di.dart';
import 'package:flutter_base/core/extensions/app_extensions.dart';
import 'package:flutter_base/features/post/domain/entities/post_entity.dart';
import 'package:flutter_base/features/post/presentation/bloc/post_bloc.dart';
import 'package:flutter_base/features/post/presentation/bloc/post_event.dart';
import 'package:my_core/import.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<PostBloc>()..add(const PostEvent.getPosts()),
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
        onPressed: () =>
            context.read<PostBloc>().add(const PostEvent.getPosts()),
      ),
      body: BlocBuilder<PostBloc, CommonState<List<PostEntity>>>(
        builder: (context, state) {
          final posts = state.data ?? [];

          return CommonStateWidget(
            state: state,
            onRetry: () =>
                context.read<PostBloc>().add(const PostEvent.getPosts()),
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title, style: context.appStyle.specialTitle),
                  subtitle: Text(post.body, style: context.appStyle.labelSmall),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
