import 'package:flutter_base/features/translate/domain/entities/language_entity.dart';
import 'package:flutter_base/features/translate/domain/usecases/manager_vocabulary_usecase.dart';
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
        getLanguages: () async {
          emit(CommonState.loading());

          try {
            final result = await _languagesUseCase.execute();
            emit(CommonState.success(result));
          } catch (e) {
            emit(CommonState.failure(e.toString()));
          }
        },
      );
    });
  }
}
