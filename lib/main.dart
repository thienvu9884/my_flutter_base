import 'package:flutter/material.dart';
import 'package:flutter_base/core/cubit/locale/locale_cubit.dart';
import 'package:flutter_base/di.dart';
import 'package:flutter_base/features/post/presentation/screens/post_screen.dart';
import 'package:flutter_base/core/cubit/theme/theme_cubit.dart';
import 'package:flutter_base/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_core/import.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  Bloc.observer = const SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di<ThemeCubit>()),
        BlocProvider(create: (_) => di<LocaleCubit>()),
      ],
      child: const MyAppView(),
    );
  }
}

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    // Lắng nghe sự thay đổi của ThemeMode
    final themeMode = context.select((ThemeCubit cubit) => cubit.state);
    // Lắng nghe sự thay đổi của Locale
    final locale = context.select((LocaleCubit cubit) => cubit.state);

    return BlocProvider(
      create: (_) => di<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            themeMode: themeMode,
            title: 'Flutter Base',
            theme: AppThemeFactory.create(isDark: false),
            darkTheme: AppThemeFactory.create(isDark: true),
            home: const PostScreen(),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: context.watch<LocaleCubit>().state,
          );
        },
      ),
    );
  }
}
