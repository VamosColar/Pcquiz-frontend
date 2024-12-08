import 'package:educagame/app/home_page.dart';
import 'package:educagame/controller/quiz_controller.dart';
import 'package:educagame/repository/quiz_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Injeção do Repository no Controller
    final QuizController quizController = Get.put(
      QuizController(repository: QuizRepository()),
    );

    if (quizController.quizCompleted.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
      return const SizedBox();
    }
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFFB405),
                Color(0xffE8930A),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Indicador de progresso
              Container(
                decoration: BoxDecoration(
                  color: const Color(0XFF7646F0),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color(0xFF660185),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    StepProgressIndicator(
                      totalSteps: quizController.questions.length,
                      currentStep: quizController.questionIndex.value + 1,
                      size: 26,
                      padding: 2,
                      selectedColor: const Color(0xFFE5F90E),
                      unselectedColor: Colors.grey,
                      roundedEdges: const Radius.circular(2),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "${quizController.questionIndex.value + 1}/${quizController.questions.length}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'InriaSans',
                      ),
                    ),
                  ],
                ),
              ),
              // Título
              Text(
                'Missão Segurança',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 600 ? 22 : 15,
                  fontFamily: 'BalooThambi',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF713302),
                  shadows: const [
                    Shadow(
                      blurRadius: 4.0,
                      color: Color(0xffFAE7CD),
                      offset: Offset(2.0, 1.0),
                    ),
                  ],
                ),
              ),
              // Container de pontuação
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0467D),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color(0xFF660185),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/score.svg',
                      width: 26,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "${quizController.score.value}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Color(0xFF660185),
                            offset: Offset(1.5, 1.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFB405),
              Color(0xffE8930A),
            ],
          ),
        ),
        child: Obx(() {
          if (quizController.questions.isEmpty) {
            return const CircularProgressIndicator();
          }
          final question =
              quizController.questions[quizController.questionIndex.value];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              width: 4, color: Color(0xFF793C0B)),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        question.fase,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF793C0B),
                          fontSize: 20,
                          fontFamily: 'BalooThambi',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          question.imagePath,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF3F2C1A),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF844400),
                        width: 8.0,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '?',
                          style: TextStyle(
                            fontFamily: 'AbhayaLibre-ExtraBold',
                            fontSize: 126,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff592E04),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            question.title,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Lista de botões de opções
                  ...List.generate(question.options.length, (index) {
                    return Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                    width: 4, color: Color(0xFF793C0B)),
                              ),
                            ),
                            onPressed: () {
                              quizController.checkAnswer(context, index);
                            },
                            child: Text(
                              question.options[index].option,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    );
                  }),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
