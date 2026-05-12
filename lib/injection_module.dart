import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:my_core/import.dart';

@module
abstract class InjectionModule {
  /// Tạo các instance singleton thủ công
  @lazySingleton
  Dio get dio => DioClient().instance;

  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  // @lazySingleton
  // FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
