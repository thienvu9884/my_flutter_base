import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'app_state_base.dart';

part 'common_state.freezed.dart';

@freezed
class CommonState<T> with _$CommonState<T> implements AppStateBase {
  const CommonState._(); // Constructor bắt buộc để viết Getter

  const factory CommonState.initial() = _Initial;

  const factory CommonState.loading() = _Loading;

  const factory CommonState.success(
    T data, {
    @Default(false) bool isLoadMore,
    @Default(false) bool hasReachedMax,
    DocumentSnapshot? lastDoc,
  }) = _Success<T>;

  const factory CommonState.failure(String message) = _Failure;

  // Implement AppStateBase cho CommonState
  @override
  bool get isLoading => this is _Loading;

  @override
  String? get error =>
      maybeWhen(failure: (message) => message, orElse: () => null);

  @override
  bool get hasData {
    return this is _Success<T> && data is List
        ? (data as List).isNotEmpty
        : data != null;
  }

  T? get data =>
      maybeWhen(success: (data, _, _, _) => data, orElse: () => null);
}
