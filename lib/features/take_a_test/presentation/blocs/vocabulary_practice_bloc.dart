import 'package:flutter_base/features/take_a_test/domain/entities/vocabulary_entity.dart';
import 'package:flutter_base/features/take_a_test/domain/usecases/vocabulary_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_core/import.dart';

part 'vocabulary_practice_event.dart';

part 'vocabulary_practice_state.dart';

part 'vocabulary_practice_bloc.freezed.dart';

@injectable
class VocabularyPracticeBloc
    extends BaseBloc<VocabularyPracticeEvent, VocabularyPracticeState> {
  final VocabulariesUseCase _vocabulariesUseCase;

  VocabularyPracticeBloc(this._vocabulariesUseCase)
    : super(const VocabularyPracticeState(status: BaseStatus.initial)) {
    on<VocabularyPracticeEvent>((event, emit) async {
      await event.when(
        started: (categoryId) async => _onStarted(categoryId, emit),
        checkAnswer: (answer) async => _onCheckAnswer(answer, emit),
        nextQuestion: () async => _onNextQuestion(emit),
        switchAV: () async => _onSwitchAV(emit),
        reset: () async => _onReset(emit),
      );
    });
  }

  Future<void> _onStarted(
    String categoryId,
    Emitter<VocabularyPracticeState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatus.loading));

    final result = await _vocabulariesUseCase.execute(categoryId);

    result.fold(
      (l) =>
          emit(state.copyWith(status: BaseStatus.failure, message: l.message)),
      (r) {
        r.shuffle();
        emit(state.copyWith(status: BaseStatus.success, vocabularies: r));
      },
    );
  }

  void _onCheckAnswer(String answer, Emitter<VocabularyPracticeState> emit) {
    // final current = state.currentVocab;
    // if (current == null) return;
    //
    // final isCorrect =
    //     current.vietnamese.trim().toLowerCase() == answer.trim().toLowerCase();
    //
    // emit(state.copyWith(isCorrect: isCorrect));
    emit(state.copyWith(showAnswer: true));
  }

  void _onSwitchAV(Emitter<VocabularyPracticeState> emit) {
    emit(state.copyWith(isAV: !state.isAV));
  }

  void _onNextQuestion(Emitter<VocabularyPracticeState> emit) {
    if (!state.isLastItem) {
      emit(
        state.copyWith(currentIndex: state.currentIndex + 1, showAnswer: false),
      );
    }
  }

  void _onReset(Emitter<VocabularyPracticeState> emit) {
    emit(state.copyWith(currentIndex: 0, showAnswer: false));
  }
}
