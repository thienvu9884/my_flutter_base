import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';
import 'package:flutter_base/features/translate/domain/usecases/language_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_core/import.dart';

part 'manager_vocabulary_event.dart';

part 'manager_vocabulary_state.dart';

part 'manager_vocabulary_bloc.freezed.dart';

@injectable
class ManagerVocabularyBloc
    extends Bloc<ManagerVocabularyEvent, ManagerVocabularyState> {
  final LanguagesUseCase _languagesUseCase;

  ManagerVocabularyBloc(this._languagesUseCase)
    : super(const ManagerVocabularyState.initial()) {
    on<ManagerVocabularyEvent>((event, emit) async {
      await event.when(
        addVocabulary: (String category, String en, String vi) async {
          emit(const ManagerVocabularyState.adding());

          try {
            final language = await _languagesUseCase.addVocabulary(
              category: category,
              en: en,
              vi: vi,
            );

            emit(ManagerVocabularyState.success(language));
          } catch (e) {
            rethrow;
          }
        },
      );
    });
  }
}
