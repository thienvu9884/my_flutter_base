import 'package:flutter/material.dart';

class MyTextTheme extends ThemeExtension<MyTextTheme> {
  final TextStyle specialTitle;
  final TextStyle discountLabel;
  final TextStyle ghostText;
  final TextStyle displayLarge;
  final TextStyle bodyMedium;
  final TextStyle titleSmall;
  final TextStyle labelSmall;

  MyTextTheme({
    required this.specialTitle,
    required this.discountLabel,
    required this.ghostText,
    required this.displayLarge,
    required this.bodyMedium,
    required this.titleSmall,
    required this.labelSmall,
  });

  @override
  MyTextTheme copyWith({
    TextStyle? specialTitle,
    TextStyle? discountLabel,
    TextStyle? ghostText,
    TextStyle? displayLarge,
    TextStyle? bodyMedium,
    TextStyle? titleSmall,
    TextStyle? labelSmall,
  }) {
    return MyTextTheme(
      specialTitle: specialTitle ?? this.specialTitle,
      discountLabel: discountLabel ?? this.discountLabel,
      ghostText: ghostText ?? this.ghostText,
      displayLarge: displayLarge ?? this.displayLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      labelSmall: labelSmall ?? this.labelSmall,
    );
  }

  @override
  MyTextTheme lerp(ThemeExtension<MyTextTheme>? other, double t) {
    if (other is! MyTextTheme) return this;
    return MyTextTheme(
      specialTitle: TextStyle.lerp(specialTitle, other.specialTitle, t)!,
      discountLabel: TextStyle.lerp(discountLabel, other.discountLabel, t)!,
      ghostText: TextStyle.lerp(ghostText, other.ghostText, t)!,
      displayLarge: TextStyle.lerp(displayLarge, other.displayLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
    );
  }
}