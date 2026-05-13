import 'package:freezed_annotation/freezed_annotation.dart';

part 'languages_event.freezed.dart';

@freezed
abstract class LanguagesEvent with _$LanguagesEvent {
  const LanguagesEvent._();

  const factory LanguagesEvent.getLanguages({required String category}) =
      _GetLanguagesEvent;
}
