part of 'manager_vocabulary_bloc.dart';

@freezed
class ManagerVocabularyState with _$ManagerVocabularyState {
  const ManagerVocabularyState._();

  const factory ManagerVocabularyState.initial() = _Initial;

  const factory ManagerVocabularyState.adding() = _Adding;

  const factory ManagerVocabularyState.success(LanguageEntity language) =
      _Success;

  const factory ManagerVocabularyState.failure(String message) = _Failure;
}
