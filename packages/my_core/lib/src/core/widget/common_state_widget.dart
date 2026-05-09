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
    // 1. Kiểm tra Loading
    if (state.isLoading) {
      print('loadinggggggggg');
      return loadingView ?? const Center(child: CircularProgressIndicator());
    }

    // 2. Kiểm tra Lỗi
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

    // 3. Nếu không có data (tùy chọn)
    if (!state.hasData && !state.isLoading) {
      return const Center(child: Text("Không có dữ liệu"));
    }

    // 4. Trả về nội dung chính khi đã thành công
    return child;
  }
}
