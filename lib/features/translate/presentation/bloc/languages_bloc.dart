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
          await state.maybeMap(
            success: (currentState) async {
              // 1. CHẶN: Nếu đang load hoặc đã hết data thì không làm gì cả
              if (currentState.isLoadMore || currentState.hasReachedMax) return;

              // 2. BẬT LOADING: dùng copyWith để UI hiện vòng quay ở cuối
              emit(currentState.copyWith(isLoadMore: true));

              try {
                // 3. QUAN TRỌNG: Lấy lastDoc trực tiếp từ currentState (State hiện tại của Bloc)
                final result = await _languagesUseCase.execute(
                  category,
                  lastDoc: currentState.lastDoc,
                );

                emit(
                  currentState.copyWith(
                    isLoadMore: false,
                    data: [...currentState.data, ...result.entities],
                    lastDoc: result.lastDoc,
                    hasReachedMax: result.entities.isEmpty,
                  ),
                );
              } catch (e) {
                emit(currentState.copyWith(isLoadMore: false));
              }
            },
            // Trường hợp load lần đầu (Initial/Loading/Failure)
            orElse: () async {
              emit(const CommonState.loading());
              try {
                final result = await _languagesUseCase.execute(category);
                emit(
                  CommonState.success(
                    result.entities,
                    lastDoc: result.lastDoc,
                    hasReachedMax: result.entities.isEmpty,
                  ),
                );
              } catch (e) {
                emit(CommonState.failure(e.toString()));
              }
            },
          );
        },
      );
    });
  }
}
