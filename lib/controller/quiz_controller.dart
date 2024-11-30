import 'package:educagame/app/quiz_result_page.dart';
import 'package:educagame/models/question_model.dart';
import 'package:educagame/repository/quiz_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  final QuizRepository repository;
// controlando minha logic DE ESTADO
  // Constructor que aceita o repository como dependência
  QuizController({required this.repository});

  var questionIndex = 0.obs;
  var score = 0.obs;

  late final List<Question> questions;

  @override
  void onInit() {
    super.onInit();
    // Obtemos as perguntas do Repository
    questions = repository.fetchQuestions();
  }

  void checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[questionIndex.value].correctAnswerIndex) {
      score.value++;
      Get.snackbar("Resposta correta", "Parabéns!");
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text("Resposta incorreta"),
          content: Text(
            questions[questionIndex.value].explanation,
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Entendido"),
            ),
          ],
        ),
      );
    }

    if (questionIndex.value < questions.length - 1) {
      questionIndex.value++;
    } else {
      Get.to(() => QuizResultPage(score: score.value));
    }
  }
}
