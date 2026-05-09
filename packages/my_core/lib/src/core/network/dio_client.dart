import 'package:dio/dio.dart';
import 'package:my_core/src/core/constants/base_constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  late Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        responseType: ResponseType.json,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Thêm Interceptor để xử lý log và header tự động
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Ví dụ: Thêm Token vào header nếu có
          // final token = ...;
          // options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // Xử lý lỗi tập trung (ví dụ: 401 logout)
          return handler.next(e);
        },
      ),
    );

    // Dùng để in log đẹp trong quá trình debug
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
      compact: false,
      maxWidth: 90,
    ));
  }

  Dio get instance => _dio;
}
