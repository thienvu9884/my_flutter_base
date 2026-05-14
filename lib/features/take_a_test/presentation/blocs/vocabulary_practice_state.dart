part of 'vocabulary_practice_bloc.dart';

enum BaseStatus { initial, loading, success, failure }

@freezed
abstract class VocabularyPracticeState with _$VocabularyPracticeState {
  const VocabularyPracticeState._();

  const factory VocabularyPracticeState({
    @Default(BaseStatus.initial) BaseStatus status,
    @Default([]) List<VocabularyEntity> vocabularies,
    @Default(0) int currentIndex,
    String? message,
    @Default(false) bool showAnswer,
    @Default(true) bool isAV,
  }) = _VocabularyPracticeState;

  VocabularyEntity? get currentVocab =>
      vocabularies.isNotEmpty && currentIndex < vocabularies.length
      ? vocabularies[currentIndex]
      : null;

  bool get isLastItem => currentIndex == vocabularies.length - 1;
}
