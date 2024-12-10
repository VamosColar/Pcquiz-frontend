import 'package:educagame/app/home_page.dart';
import 'package:educagame/app/quiz_result_page.dart';
import 'package:educagame/models/question_model.dart';
import 'package:educagame/repository/quiz_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  final QuizRepository repository;

  QuizController({required this.repository});

  var questions = <Question>[].obs;
  var questionIndex = 0.obs;
  var score = 0.obs;
  var explanation = "".obs;
  var isShowingFeedback = false.obs;
  var quizCompleted = false.obs;
  var feedbackDelay = 3.obs; // Tempo de exibição do feedback

  @override
  void onInit() {
    super.onInit();
    questions.value = repository.getQuestions();
  }

  void checkAnswer(BuildContext context, int selectedIndex) {
    if (isShowingFeedback.value) return; // Evita múltiplas chamadas

    isShowingFeedback.value = true; // Feedback iniciado
    final currentQuestion = questions[questionIndex.value];

    if (selectedIndex == currentQuestion.correctAnswerIndex) {
      score.value++;
      explanation.value = currentQuestion.explanation;
      showFeedbackDialog(context, true, "Correto!", explanation.value);
    } else {
      explanation.value = currentQuestion.options[selectedIndex].explanation;
      showFeedbackDialog(context, false, "Tente novamente!", explanation.value);
    }
  }

  void showFeedbackDialog(
      BuildContext context, bool isCorrect, String title, String message) {
    showDialog(
      context: context,
      barrierDismissible: false, // Impede o fechamento fora do diálogo
      builder: (context) {
        return AlertDialog(
          backgroundColor:
              isCorrect ? const Color(0xFF4A7B0F) : const Color(0xFF7B0F0F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color:
                  isCorrect ? const Color(0xFF84E760) : const Color(0xFFFF2103),
              width: 4,
            ),
          ),
          title: Row(
            children: [
              const SizedBox(width: 30),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Row(
            children: [
              SvgPicture.asset(
                isCorrect
                    ? 'assets/images/correto.svg'
                    : 'assets/images/atencao2.svg',
                width: 45,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    Future.delayed(Duration(seconds: feedbackDelay.value), () {
      Navigator.of(context).pop();
      if (isCorrect) {
        showNextPhaseDialog(context);
      } else {
        isShowingFeedback.value = false; // Reset para próxima interação
      }
    });
  }

  void showNextPhaseDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Bloqueia fechamento externo
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFFFF5CC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFFDDB144), width: 2),
          ),
          title: const Center(
            child: Text(
              "PARABÉNS!",
              style: TextStyle(
                color: Color(0xFF93570D),
                fontSize: 36,
                fontFamily: 'BalooThambi',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 6.0,
                children: List.generate(
                  score.value,
                  (index) => const Icon(
                    Icons.star,
                    color: Color(0xFFFFC700),
                    size: 56,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Você conquistou uma estrela nesta fase!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF43392F),
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  moveToNextQuestion(context);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 6,
                  backgroundColor: const Color(0xFFFEB205),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(width: 4, color: Color(0xffFFF0C3)),
                  shadowColor: const Color(0xFF271B0F),
                ),
                child: const Text(
                  "Próxima Fase",
                  style: TextStyle(
                    fontFamily: 'BalooThambi',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    decorationThickness: 2.0,
                    color: Color(0xFF271B0F),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 6,
                  backgroundColor: const Color.fromARGB(255, 250, 224, 162),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 38),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(width: 4, color: Color(0xffFFF0C3)),
                  shadowColor: const Color(0xFF271B0F),
                ),
                child: const Text(
                  "Sair do Jogo",
                  style: TextStyle(
                    fontFamily: 'BalooThambi',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    decorationThickness: 2.0,
                    color: Color(0xFF271B0F),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void moveToNextQuestion(BuildContext context) {
    if (questionIndex.value < questions.length - 1) {
      questionIndex.value++;
      isShowingFeedback.value = false; // Reseta feedback
    } else {
      quizCompleted.value = true; // Marca o quiz como concluído
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultPage(score: score.value),
        ),
        (route) => false, // Remove todas as telas anteriores da pilha
      );
    }
  }
}
