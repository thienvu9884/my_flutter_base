import 'package:flutter/material.dart';
import 'package:flutter_base/generated/l10n.dart';
import 'package:my_core/import.dart';

extension AppExtension on BuildContext {
  MyTextTheme get appStyle => Theme.of(this).extension<MyTextTheme>()!;

  S get translate => S.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
