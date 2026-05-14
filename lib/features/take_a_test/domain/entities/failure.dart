import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

// Lỗi khi gọi API hoặc kết nối Server
class ServerFailure extends Failure {
  const ServerFailure({String message = "Lỗi kết nối server"}) : super(message);
}

// Lỗi khi truy vấn Database nội bộ (Sqflite, Hive)
class DatabaseFailure extends Failure {
  const DatabaseFailure({String message = "Lỗi truy xuất dữ liệu"}) : super(message);
}

// Lỗi không có internet
class ConnectionFailure extends Failure {
  const ConnectionFailure({String message = "Không có kết nối mạng"}) : super(message);
}
