import 'package:educagame/widgets/custom_btn_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuizResultPage extends StatelessWidget {
  final int score;

  const QuizResultPage({required this.score});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Impede que o usuário volte para telas anteriores
        return false;
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: const CustomBtnSpeedDial(), // settings
        backgroundColor: Colors.transparent,
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
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
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
                              const Icon(Icons.star,
                                  color: Colors.amber,
                                  size: 40,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 2.0,
                                      color: Colors.white,
                                      offset: Offset(1, 2),
                                    ),
                                  ]),
                              const Icon(Icons.star,
                                  color: Colors.amber,
                                  size: 40,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 2.0,
                                      color: Colors.white,
                                      offset: Offset(1, 2),
                                    ),
                                  ]),
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
                              const Icon(Icons.star,
                                  color: Colors.amber,
                                  size: 40,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 2.0,
                                      color: Colors.white,
                                      offset: Offset(1, 2),
                                    ),
                                  ]),
                              const SizedBox(
                                width: 4,
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/smile.svg',
                                      width: 140,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Se você suspeita de violência contra crianças ou adolescentes, ligue para:\nDisque 100 - Disque Direitos Humanos\nDisque 190 - Polícia Militar',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF332C24),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Dicas importantes:\n• Sempre confie em seus instintos\n• Não tenha medo de pedir ajuda\n• Sua segurança é a prioridade número um!',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF332C24),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Juntos, podemos criar um mundo mais seguro para todos!',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF332C24),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
