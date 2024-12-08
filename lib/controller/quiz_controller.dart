import 'package:educagame/app/home_page.dart';
import 'package:educagame/app/quiz_result_page.dart';
import 'package:educagame/models/question_model.dart';
import 'package:educagame/repository/quiz_repository.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class QuizController extends GetxController {
  final QuizRepository repository;

  QuizController({required this.repository});

  var questions = <Question>[].obs;
  var questionIndex = 0.obs;
  var score = 0.obs;
  var explanation = "".obs;
  var isShowingFeedback = false.obs;
  var quizCompleted = false.obs;

  @override
  void onInit() {
    super.onInit();
    questions.value = repository.getQuestions();
  }

  void checkAnswer(BuildContext context, int selectedIndex) {
    final currentQuestionIndex = questionIndex.value;
    isShowingFeedback.value = true;

    if (selectedIndex == questions[currentQuestionIndex].correctAnswerIndex) {
      score.value++;
      explanation.value = questions[currentQuestionIndex].explanation;
      showFeedbackDialog(context, true, "Correto!", explanation.value);
    } else {
      explanation.value =
          questions[currentQuestionIndex].incorrectExplanations[selectedIndex];
      showFeedbackDialog(context, false, "Tente novamente!", explanation.value);
    }
  }

  void showFeedbackDialog(
      BuildContext context, bool isCorrect, String title, String message) {
    showDialog(
      context: context,
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

    if (isCorrect) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pop(); // Fecha o primeiro diálogo

        // Exibe o diálogo para a próxima fase
        showNextPhaseDialog(context);
      });
    }
  }

  void showNextPhaseDialog(BuildContext context) {
    showDialog(
      context: context,
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
              // Gera as estrelas com base no score
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0,
                children: List.generate(
                  score.value, // Baseado no score atual
                  (index) => const Icon(
                    Icons.star,
                    color: Color(0xFFFFC700),
                    size: 56,
                    // size: score.value > 5 ? 40 : 56, // perguntar se tera muitas fase, se tiver Reduz tamanho se muitas estrelas
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
                onPressed: () {
                  Navigator.of(context).pop();
                  moveToNextQuestion(context);
                },
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
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
      isShowingFeedback.value = false; // Reset feedback da proxima questao
    } else {
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
