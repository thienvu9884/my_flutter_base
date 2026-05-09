import 'package:injectable/injectable.dart';
import 'package:my_core/import.dart';

@module
abstract class InjectionModule {
  /// Tạo các instance singleton thủ công
  @lazySingleton
  Dio get dio => DioClient().instance;

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
