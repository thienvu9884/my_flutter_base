import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_core/module_config.module.dart';

import 'di.config.dart';

final di = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // Tên hàm khởi tạo trong file .config
  preferRelativeImports: true,
  asExtension: true, // Cho phép gọi dưới dạng getIt.init()
  externalPackageModulesBefore: [ExternalModule(MyCorePackageModule)],
)
Future<void> setupLocator() async => di.init();
