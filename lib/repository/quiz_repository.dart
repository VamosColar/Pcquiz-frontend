import 'package:educagame/models/category_model.dart';
import 'package:educagame/models/question_model.dart';
import 'package:educagame/services/quiz_service.dart';

class QuizRepository {
  final QuizService quizService;

  QuizRepository({required this.quizService});

  // Busca categorias da API
  Future<List<Category>> fetchCategories() async {
    return await quizService.fetchCategories();
  }

  // Busca perguntas de uma categoria
  Future<List<Question>> fetchQuestionsByCategory(int categoryId) async {
    return await quizService.getQuestionsByCategory(categoryId);
  }

  // Envia a resposta da questão
  Future<void> submitAnswer({
    required bool isCorrect,
    required int questionId,
    required int optionId,
    required String identify,
  }) async {
    return await quizService.submitAnswer(
      isCorrect,
      questionId: questionId,
      optionId: optionId,
      identify: identify,
    );
  }

  Future<void> submitIncorrectAttempt({
    required int questionId,
    required int optionId,
    required String identify,
  }) async {
    await quizService.submitIncorrectAttempt(
      questionId: questionId,
      optionId: optionId,
      identify: identify,
    );
  }
}
