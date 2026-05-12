import 'package:freezed_annotation/freezed_annotation.dart';
import 'app_state_base.dart';

part 'common_state.freezed.dart';

@freezed
class CommonState<T> with _$CommonState<T> implements AppStateBase {
  const CommonState._(); // Constructor bắt buộc để viết Getter

  const factory CommonState.initial() = _Initial;

  const factory CommonState.loading() = _Loading;

  const factory CommonState.success(T data) = _Success<T>;

  const factory CommonState.failure(String message) = _Failure;

  // Implement AppStateBase cho CommonState
  @override
  bool get isLoading => this is _Loading;

  @override
  String? get error =>
      maybeWhen(failure: (message) => message, orElse: () => null);

  @override
  bool get hasData => this is _Success<T>;

  // Getter tiện ích để lấy data nhanh
  T? get data => maybeWhen(success: (data) => data, orElse: () => null);
}
