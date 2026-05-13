import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';
import 'package:flutter_base/features/translate/domain/usecases/language_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:my_core/import.dart';

import 'languages_event.dart';

@injectable
class LanguagesBloc
    extends BaseBloc<LanguagesEvent, CommonState<List<LanguageEntity>>> {
  final LanguagesUseCase _languagesUseCase;

  LanguagesBloc(this._languagesUseCase) : super(const CommonState.initial()) {
    on<LanguagesEvent>((event, emit) async {
      await event.when(
        getLanguages: (category) async {
          emit(const CommonState.loading());

          try {
            final result = await _languagesUseCase.execute(category);
            emit(CommonState.success(result));
          } catch (e) {
            emit(CommonState.failure(e.toString()));
          }
        },
      );
    });
  }
}
