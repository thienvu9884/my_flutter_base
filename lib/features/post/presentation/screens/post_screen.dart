import 'package:flutter/material.dart';
import 'package:flutter_base/di.dart';
import 'package:flutter_base/core/extensions/app_extensions.dart';
import 'package:flutter_base/features/post/domain/entities/post_entity.dart';
import 'package:flutter_base/features/post/presentation/bloc/post_bloc.dart';
import 'package:flutter_base/core/cubit/theme/theme_cubit.dart';
import 'package:flutter_base/features/post/presentation/bloc/post_event.dart';
import 'package:my_core/import.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('JSONPlaceholder Posts'),
        actions: [
          IconButton(
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            icon: Icon(Icons.dark_mode),
          ),
        ],
      ),
      floatingActionButton: IconButton(
        onPressed: () => _fetchPostsData(context),
        icon: Icon(Icons.cloud_download, size: 36),
      ),
      body: BlocProvider(
        create: (_) => di<PostBloc>()..add(const PostEvent.getPosts()),
        child: BlocBuilder<PostBloc, CommonState<List<PostEntity>>>(
          buildWhen: (previous, current) => true,
          builder: (context, state) {
            final posts = state.data ?? [];
            print('stateeeeeee: ${state.isLoading}');

            return CommonStateWidget(
              state: state,
              onRetry: () => _fetchPostsData(context),
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(
                      post.title,
                      style: context.appStyle.specialTitle,
                    ),
                    subtitle: Text(
                      post.body,
                      style: context.appStyle.labelSmall,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _fetchPostsData(BuildContext context) =>
      di<PostBloc>().add(const PostEvent.getPosts());
}
