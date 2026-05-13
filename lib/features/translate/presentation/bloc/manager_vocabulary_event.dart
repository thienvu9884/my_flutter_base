part of 'manager_vocabulary_bloc.dart';

@freezed
abstract class ManagerVocabularyEvent with _$ManagerVocabularyEvent {
  const ManagerVocabularyEvent._();

  const factory ManagerVocabularyEvent.addVocabulary({
    required String category,
    required String en,
    required String vi,
  }) = _AddVocabulary;
}
