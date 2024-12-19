import 'package:educagame/app/home_page.dart';
import 'package:educagame/app/quiz_result_page.dart';
import 'package:educagame/controller/auth_controller.dart';
import 'package:educagame/models/category_model.dart';
import 'package:educagame/models/option_model.dart';
import 'package:educagame/models/question_model.dart';
import 'package:educagame/repository/quiz_repository.dart';
import 'package:educagame/services/quiz_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  final QuizRepository repository;
  final QuizService quizService;

  QuizController({
    required this.repository,
    required this.quizService,
  });

  var categories = <Category>[].obs; // Lista de categorias
  var questions = <Question>[].obs; // Perguntas da categoria selecionada
  var questionIndex = 0.obs; // Índice da pergunta atual
  var currentPhase = 0.obs; //armazena fase
  var score = 0.obs; // Pontuação do usuário
  var explanation = "".obs; // Explicação da resposta atual
  var isShowingFeedback = false.obs; // Estado do feedback
  var quizCompleted = false.obs; // Estado de conclusão do quiz
  var isLoading = false.obs; // Estado de carregamento
  var feedbackDelay = 3.obs; // Tempo de exibição do feedback
  var categoryName = "".obs; // Nome da categoria atual
  final AuthController authController = Get.find<AuthController>();

  final List<Color> backgroundColors = [
    const Color(0xFF6EAF99),
    const Color(0xFF7FAF6E),
    const Color(0xFFD77D7D),
    const Color(0xFFFFF1B7),
    const Color(0xFFACE8E0),
  ];
  Color get backgroundColor =>
      backgroundColors[currentPhase.value % backgroundColors.length];
  @override
  void onInit() {
    super.onInit();
    fetchCategories().then((_) {
      if (categories.isNotEmpty) {
        fetchQuestions(categories.first.id, categories.first.name);
      }
    });
  }

  @override
  void onReady() {
    ever(questionIndex, (callback) {
      if (questions.isNotEmpty) {
        currentPhase.value = questions[questionIndex.value].fase;
      }
    });
    super.onReady();
  }

  /// Carrega categorias da API via repository
  Future<void> fetchCategories() async {
    isLoading.value = true;
    try {
      categories.value = await repository.fetchCategories();
    } catch (e) {
      print('Erro ao carregar categorias: $e');
      Get.snackbar('Erro',
          'Falha ao carregar categorias. Verifique sua conexão ou tente novamente.');
    } finally {
      isLoading.value = false;
    }
  }

  /// Carrega perguntas de uma categoria específica
  Future<void> fetchQuestions(int categoryId, String name) async {
    isLoading.value = true;
    try {
      questions.value = await repository.fetchQuestionsByCategory(categoryId);
      questionIndex.value = 0; // Reseta o índice da pergunta
      score.value = 0; // Reseta a pontuação
      categoryName.value = name;
    } catch (e) {
      print('Erro ao carregar perguntas: $e');
      Get.snackbar('Erro',
          'Falha ao carregar perguntas. Verifique sua conexão ou tente novamente.');
    } finally {
      isLoading.value = false;
    }
  }

  /// Verifica a resposta selecionada pelo usuário
  void checkAnswer(BuildContext context, int selectedIndex) async {
    if (isShowingFeedback.value || isLoading.value) return;
    isShowingFeedback.value = true;
    isLoading.value = true;

    try {
      if (questionIndex.value < 0 || questionIndex.value >= questions.length) {
        print("Índice de pergunta inválido.");
        return;
      }

      final currentQuestion = questions[questionIndex.value];

      final selectedOption = currentQuestion.options[selectedIndex];
      final isCorrect = selectedIndex == currentQuestion.correctAnswerIndex;

      // Marca a opção selecionada
      for (var option in currentQuestion.options) {
        option.isCorrect = false;
      }
      currentQuestion.options[selectedIndex].isCorrect = true;

      if (isCorrect) {
        score.value++;
      } else {
        // Envia tentativa incorreta para a API
        await sendIncorrectAttempt(currentQuestion.id, selectedOption.id);
      }
      await sendQuizResponse(currentQuestion, selectedOption, isCorrect);

      showFeedbackDialog(
        context,
        isCorrect,
        isCorrect ? "Correto!" : "Tente novamente!",
        isCorrect
            ? currentQuestion.explanation
            : currentQuestion.options[selectedIndex].explanation,
      );
    } finally {
      isLoading.value = false; // Desativa o carregamento
    }
  }

  /// Envia uma resposta para o endpoint
  Future<void> sendQuizResponse(
      Question question, Option selectedOption, bool isCorrect) async {
    try {
      await repository.submitAnswer(
        isCorrect: isCorrect,
        questionId: question.id,
        optionId: selectedOption.id,
        identify: authController.identify.value.isNotEmpty
            ? authController.identify.value
            : 'anonimo',
      );
      print('Resposta enviada com sucesso!');
    } catch (e) {
      print('Erro ao enviar resposta: $e');
      Get.snackbar(
        'Erro',
        'Falha ao enviar a resposta. Verifique sua conexão.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> sendIncorrectAttempt(int questionId, int optionId) async {
    try {
      final identify = authController.identify.value.isNotEmpty
          ? authController.identify.value
          : 'anonimo';

      await repository.submitIncorrectAttempt(
        questionId: questionId,
        optionId: optionId,
        identify: identify,
      );

      print('Tentativa incorreta enviada com sucesso');
    } catch (e) {
      print('Erro ao enviar tentativa incorreta: $e');
      Get.snackbar(
        'Erro',
        'Falha ao registrar tentativa incorreta. Verifique sua conexão.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Navega para a próxima pergunta ou finaliza o quiz
  void moveToNextQuestion() async {
    if (questionIndex.value < questions.length - 1) {
      questionIndex.value++;
      isShowingFeedback.value = false; // Reseta feedback
      currentPhase.value++;
      currentPhase.value = questions[questionIndex.value].fase;
    } else {
      quizCompleted.value = true; // Marca o quiz como concluído

      await sendAllAnswers(); // Envia todas as respostas ao final do quiz
//verificar se seria assim mesmo
      Get.snackbar(
        'Quiz Finalizado',
        'Você marcou ${score.value} ponto(s)!',
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offAll(() => QuizResultPage(score: score.value));
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
                  moveToNextQuestion();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFCD5C),
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
                    color: Color(0xFFD06D0B),
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
                    color: Color(0xFF71461A),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Envia todas as respostas ao concluir o quiz
  Future<void> sendAllAnswers() async {
    for (var question in questions) {
      final selectedOption = question.options.firstWhere(
        (option) => option.isCorrect,
        orElse: () => Option.empty(),
      );

      if (selectedOption.id != -1) {
        final isCorrect = selectedOption.id == question.correctAnswerIndex;
        await sendQuizResponse(question, selectedOption, isCorrect);
      } else {
        print('Nenhuma opção selecionada para a questão ${question.id}');
      }
    }
  }

  /// Exibe o diálogo de feedback
  void showFeedbackDialog(
      BuildContext context, bool isCorrect, String title, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor:
              isCorrect ? const Color(0xFF92C158) : const Color(0xffDC2A2A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color:
                  isCorrect ? const Color(0xFF84E760) : const Color(0xFFDC2A2A),
              width: 4,
            ),
          ),
          title: Row(
            children: [
              const SizedBox(width: 30),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Row(
            children: [
              isCorrect
                  ? SvgPicture.asset(
                      'assets/images/correto.svg',
                      width: 55,
                    )
                  : const Text(
                      '!',
                      style: TextStyle(
                        fontFamily: 'AbhayaLibre-ExtraBold',
                        fontSize: 146,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
    Color getBackgroundColor() {
      switch (questions[questionIndex.value].fase) {
        case 1:
          return const Color(0xFF6EAF99);

        case 2:
          return const Color(0xFF7FAF6E);
        case 3:
          return const Color(0xFFD77D7D);
        case 4:
          return const Color(0xFFFFF1B7);
        case 5:
          return const Color(0xFFACE8E0);
        default:
          return const Color(0xFFACE8E0);
      }
    }

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pop();
      if (isCorrect) {
        showNextPhaseDialog(context);
        // moveToNextQuestion();
      } else {
        isShowingFeedback.value = false;
      }
    });
  }
}
