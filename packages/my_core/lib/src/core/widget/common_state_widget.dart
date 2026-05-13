import 'package:flutter/material.dart';
import 'package:my_core/src/core/bloc/app_state_base.dart';

class CommonStateWidget<S extends AppStateBase> extends StatelessWidget {
  final S state;
  final Widget child;
  final VoidCallback? onRetry;
  final Widget? loadingView;

  const CommonStateWidget({
    super.key,
    required this.state,
    required this.child,
    this.onRetry,
    this.loadingView,
  });

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return loadingView ?? const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.error!),
            if (onRetry != null)
              ElevatedButton(onPressed: onRetry, child: const Text("Thử lại")),
          ],
        ),
      );
    }

    if (!state.hasData) {
      return const Center(child: Text("Không có dữ liệu"));
    }

    return child;
  }
}
