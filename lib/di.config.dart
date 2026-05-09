// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:my_core/import.dart' as _i566;
import 'package:my_core/module_config.module.dart' as _i880;

import 'core/cubit/locale/locale_cubit.dart' as _i867;
import 'core/cubit/theme/theme_cubit.dart' as _i501;
import 'features/post/data/datasources/api_service.dart' as _i847;
import 'features/post/data/repositories/post_repository_impl.dart' as _i1008;
import 'features/post/domain/repositories/post_repository.dart' as _i857;
import 'features/post/domain/usecases/get_post_usecase.dart' as _i624;
import 'features/post/presentation/bloc/post_bloc.dart' as _i156;
import 'injection_module.dart' as _i212;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    await _i880.MyCorePackageModule().init(gh);
    final injectionModule = _$InjectionModule();
    gh.lazySingleton<_i867.LocaleCubit>(() => _i867.LocaleCubit());
    gh.lazySingleton<_i566.Dio>(() => injectionModule.dio);
    gh.lazySingleton<_i566.FlutterSecureStorage>(
      () => injectionModule.secureStorage,
    );
    gh.lazySingleton<_i501.ThemeCubit>(
      () => _i501.ThemeCubit(gh<_i566.IStorageService>()),
    );
    gh.lazySingleton<_i847.ApiService>(() => _i847.ApiService(gh<_i566.Dio>()));
    gh.lazySingleton<_i857.PostRepository>(
      () => _i1008.PostRepositoryImpl(gh<_i847.ApiService>()),
    );
    gh.lazySingleton<_i624.GetPostUseCase>(
      () => _i624.GetPostUseCase(gh<_i857.PostRepository>()),
    );
    gh.factory<_i156.PostBloc>(
      () => _i156.PostBloc(gh<_i624.GetPostUseCase>()),
    );
    return this;
  }
}

class _$InjectionModule extends _i212.InjectionModule {}
