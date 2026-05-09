import 'package:flutter/material.dart';
import 'package:my_core/import.dart';

extension AppExtension on BuildContext {
  MyTextTheme get appStyle => Theme.of(this).extension<MyTextTheme>()!;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
