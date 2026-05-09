import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../network/api_exception.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  BaseBloc(super.initialState);

  /// Hàm xử lý lỗi tập trung
  /// [e]: Lỗi bắt được từ catch
  /// [emit]: Hàm emit của Bloc
  /// [errorStateBuilder]: Hàm trả về State lỗi tương ứng (ví dụ: failure state)
  void handleException({
    required Object e,
    required Emitter<S> emit,
    required S Function(String message) errorStateBuilder,
  }) {
    String errorMessage = "Đã xảy ra lỗi, vui lòng thử lại.";

    if (e is DioException) {
      final apiEx = ApiException.fromDioError(e);
      errorMessage = apiEx.message;

      // Bạn có thể xử lý logic đặc biệt tại đây (ví dụ: 401 thì logout)
      if (apiEx.statusCode == 401) {
        // Gọi hàm logout toàn cục hoặc điều hướng
      }
    } else if (e is ApiException) {
      errorMessage = e.message;
    } else {
      errorMessage = e.toString();
    }

    emit(errorStateBuilder(errorMessage));
  }
}
