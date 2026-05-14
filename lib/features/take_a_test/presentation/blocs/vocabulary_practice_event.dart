part of 'vocabulary_practice_bloc.dart';

@freezed
abstract class VocabularyPracticeEvent with _$VocabularyPracticeEvent {
  const VocabularyPracticeEvent._();

  // Event khởi tạo: lấy danh sách từ vựng theo categoryId hoặc category object
  const factory VocabularyPracticeEvent.started(String categoryId) = _Started;

  // Event kiểm tra đáp án người dùng nhập vào
  const factory VocabularyPracticeEvent.checkAnswer(String answer) =
      _CheckAnswer;

  const factory VocabularyPracticeEvent.switchAV() =
      _SwitchAV;

  // Event chuyển sang câu tiếp theo
  const factory VocabularyPracticeEvent.nextQuestion() = _NextQuestion;

  // Event reset lại trạng thái nếu cần luyện tập lại từ đầu
  const factory VocabularyPracticeEvent.reset() = _Reset;
}
