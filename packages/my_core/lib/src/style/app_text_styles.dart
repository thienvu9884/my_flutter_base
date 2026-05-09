import 'package:flutter/material.dart';

class AppTextStyles {
  static const double _h1 = 32.0;
  static const double _body = 16.0;
  static const double _titleSmall = 14.0;
  static const double _labelSmall = 12.0;
  static const double _specialTitle = 18.0;
  static const double _discountLabel = 16.0;
  static const double _ghostText = 14.0;

  static TextStyle get heading1 => const TextStyle(
    fontSize: _h1,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static TextStyle get bodyM =>
      const TextStyle(fontSize: _body, fontWeight: FontWeight.normal);

  static TextStyle get titleSmall =>
      const TextStyle(fontSize: _titleSmall, fontWeight: FontWeight.bold);

  static TextStyle get labelSmall =>
      const TextStyle(fontSize: _labelSmall, fontWeight: FontWeight.normal);

  static TextStyle get specialTitle =>
      const TextStyle(fontSize: _specialTitle, fontWeight: FontWeight.bold);

  static TextStyle get discountLabel =>
      const TextStyle(fontSize: _discountLabel, fontWeight: FontWeight.normal);

  static TextStyle get ghostText =>
      const TextStyle(fontSize: _ghostText, fontWeight: FontWeight.normal);
}
