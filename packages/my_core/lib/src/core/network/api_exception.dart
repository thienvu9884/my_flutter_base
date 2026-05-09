import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  factory ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException("Kết nối quá hạn, vui lòng thử lại.");
      case DioExceptionType.receiveTimeout:
        return ApiException("Máy chủ phản hồi chậm, vui lòng thử lại.");
      case DioExceptionType.badResponse:
        return _handleStatusCode(
          error.response?.statusCode,
          error.response?.data,
        );
      case DioExceptionType.connectionError:
        return ApiException("Không có kết nối internet.");
      default:
        return ApiException("Đã xảy ra lỗi không xác định.");
    }
  }

  static ApiException _handleStatusCode(int? statusCode, dynamic data) {
    // Tùy theo cấu trúc Backend của bạn mà lấy field message cho đúng
    final serverMessage = data is Map ? data['message'] : null;

    switch (statusCode) {
      case 400:
        return ApiException(serverMessage ?? "Yêu cầu không hợp lệ.");
      case 401:
        return ApiException("Phiên đăng nhập hết hạn.");
      case 403:
        return ApiException("Bạn không có quyền truy cập.");
      case 404:
        return ApiException("Không tìm thấy dữ liệu.");
      case 500:
        return ApiException("Lỗi hệ thống máy chủ.");
      default:
        return ApiException("Lỗi hệ thống ($statusCode)");
    }
  }
}
