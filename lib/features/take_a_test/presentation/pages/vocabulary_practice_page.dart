import 'package:flutter/material.dart';
import 'package:flutter_base/features/take_a_test/presentation/blocs/vocabulary_practice_bloc.dart';
import 'package:my_core/import.dart';

class VocabularyPracticePage extends StatefulWidget {
  final String categoryId;

  const VocabularyPracticePage({super.key, required this.categoryId});

  @override
  State<VocabularyPracticePage> createState() => _VocabularyPracticePageState();
}

class _VocabularyPracticePageState extends State<VocabularyPracticePage> {
  final TextEditingController _answerController = TextEditingController();

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Luyện tập từ vựng"),
          actions: [
            BlocBuilder<VocabularyPracticeBloc, VocabularyPracticeState>(
              builder: (context, state) {
                return Switch(
                  value: state.isAV,
                  onChanged: (v) => context.read<VocabularyPracticeBloc>().add(
                    const VocabularyPracticeEvent.switchAV(),
                  ),
                );
              },
            ),
          ],
        ),
        body: BlocConsumer<VocabularyPracticeBloc, VocabularyPracticeState>(
          listener: (context, state) {
            if (state.status == BaseStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message ?? "Có lỗi xảy ra")),
              );
            }
          },
          builder: (context, state) {
            if (state.status == BaseStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            final currentVocab = state.currentVocab;
            if (currentVocab == null) {
              return const Center(child: Text("Không có dữ liệu từ vựng"));
            }

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Từ ${state.currentIndex + 1} / ${state.vocabularies.length}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 20),

                  Text(
                    state.isAV ? currentVocab.english : currentVocab.vietnamese,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),

                  TextField(
                    controller: _answerController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: state.isAV
                          ? "Nhập nghĩa tiếng Việt"
                          : "Nhập nghĩa tiếng Anh",
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: state.showAnswer ? Colors.grey : Colors.green,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<VocabularyPracticeBloc>().add(
                          VocabularyPracticeEvent.checkAnswer(
                            _answerController.text,
                          ),
                        );
                      },
                      child: const Text("KIỂM TRA"),
                    ),
                  ),

                  if (state.showAnswer)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        state.isAV
                            ? currentVocab.vietnamese
                            : currentVocab.english,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            );
          },
        ),

        floatingActionButton:
            BlocBuilder<VocabularyPracticeBloc, VocabularyPracticeState>(
              builder: (context, state) {
                if (state.vocabularies.isEmpty || state.isLastItem) {
                  return const SizedBox.shrink();
                }

                return FloatingActionButton(
                  onPressed: () {
                    _answerController.clear();
                    context.read<VocabularyPracticeBloc>().add(
                      const VocabularyPracticeEvent.nextQuestion(),
                    );
                  },
                  child: const Icon(Icons.arrow_forward),
                );
              },
            ),
      ),
    );
  }
}
