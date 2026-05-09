import 'package:flutter/material.dart';
import 'package:my_core/src/style/app_text_styles.dart';

import 'my_text_theme.dart';

class AppThemeFactory {
  static ThemeData create({required bool isDark, String? fontFamily}) {
    final colorScheme = isDark
        ? const ColorScheme.dark(
            primary: Colors.blueAccent,
            surface: Color(0xFF121212),
          )
        : const ColorScheme.light(primary: Colors.blue, surface: Colors.white);

    final myCustomTextTheme = MyTextTheme(
      displayLarge: AppTextStyles.heading1,
      bodyMedium: AppTextStyles.bodyM,
      titleSmall: AppTextStyles.titleSmall,
      labelSmall: AppTextStyles.labelSmall,
      specialTitle: AppTextStyles.specialTitle,
      discountLabel: AppTextStyles.discountLabel,
      ghostText: AppTextStyles.ghostText,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: fontFamily,
      extensions: [myCustomTextTheme],
      textTheme: TextTheme(bodyMedium: myCustomTextTheme.bodyMedium),
    );
  }
}
