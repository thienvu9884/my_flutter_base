import 'package:freezed_annotation/freezed_annotation.dart';

part 'languages_event.freezed.dart';

@freezed
class LanguagesEvent with _$LanguagesEvent {
  const LanguagesEvent._();

  const factory LanguagesEvent.getLanguages() = _GetLanguagesEvent;
}
