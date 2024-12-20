import 'package:educagame/app/home_page.dart';
import 'package:educagame/controller/quiz_controller.dart';
import 'package:educagame/widgets/custom_btn_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class QuizResultPage extends StatelessWidget {
  final int score;

  QuizResultPage({required this.score});
  final QuizController quizController = Get.find<QuizController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: const CustomBtnSpeedDial(),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFED295),
              Color(0xffFED295),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  const Text(
                    'Missão Completa!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'BalooThambi',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF793C0B),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SvgPicture.asset(
                    'assets/images/parabens.svg',
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 5; i++)
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 40,
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.white,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/images/smile.svg',
                          width: 140,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF844400),
                        width: 4.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text:
                                'Se você suspeita de violência contra crianças ou adolescentes, ligue para:\n\n',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF332C24),
                            ),
                            children: [
                              TextSpan(
                                text: 'Disque 100',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: ' - Disque Direitos Humanos\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: 'Disque 190',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: ' - Polícia Militar',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        RichText(
                          text: const TextSpan(
                            text: 'Dicas importantes:\n',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF332C24),
                            ),
                            children: [
                              TextSpan(
                                text: '• Sempre confie em seus instintos\n'
                                    '• Não tenha medo de pedir ajuda\n'
                                    '• Sua segurança é a prioridade número um!',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Juntos, podemos criar um mundo mais seguro para todos!',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Inter',
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Botão "Jogar"
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      backgroundColor: const Color(0xFFFFCD5C),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(width: 4, color: Colors.white),
                      shadowColor: const Color(0xFF271B0F),
                    ),
                    onPressed: () {
                      quizController.resetQuiz();
                    },
                    child: const Text(
                      'Voltar ao Jogo',
                      style: TextStyle(
                        fontFamily: 'BalooThambi',
                        fontSize: 26,
                        fontWeight: FontWeight.w100,
                        decorationThickness: 2.0,
                        color: Color(0xFFD06D0B),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
