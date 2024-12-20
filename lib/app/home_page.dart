import 'package:educagame/app/category_page.dart';
import 'package:educagame/controller/auth_controller.dart';
import 'package:educagame/controller/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final QuizController quizController = Get.find<QuizController>();
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    quizController
        .fetchCategories(); // Carrega as categorias ao iniciar a página
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: SpeedDial(
        overlayColor: const Color.fromARGB(255, 61, 45, 9),
        direction: SpeedDialDirection.down,
        backgroundColor: const Color(0xFFEAC674),
        foregroundColor: const Color(0xffDE3400),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.arrow_back),
            backgroundColor: const Color(0xFFEAC674),
            foregroundColor: const Color(0xffDE3400),
            onTap: () => Navigator.of(context).pop(),
          ),
          SpeedDialChild(
            child: const Icon(Icons.share),
            backgroundColor: const Color(0xFFEAC674),
            foregroundColor: const Color(0xffDE3400),
            onTap: () => print('Compartilhar'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.help_outline, size: 30),
            backgroundColor: const Color(0xFFEAC674),
            foregroundColor: const Color(0xffDE3400),
            onTap: () => print('Ajuda'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.logout),
            backgroundColor: const Color(0xFFEAC674),
            foregroundColor: const Color(0xffDE3400),
            onTap: () {
              authController.logout();
            },
          ),
        ],
        child: const Icon(
          Icons.settings,
          size: 30,
          color: Color(0xFFDE3400),
          shadows: [
            Shadow(
              blurRadius: 4.0,
              color: Color(0xffFAE7CD),
              offset: Offset(2.0, 1.0),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xffFECF6A),
          child: Center(
            child: Obx(() {
              if (quizController.isLoading.value) {
                return const CircularProgressIndicator();
              }

              if (quizController.categories.isEmpty) {
                return const Text(
                  "Nenhuma missão disponível",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 120),
                  Image.asset('assets/images/agente.png'),
                  const SizedBox(height: 20),
                  ...quizController.categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 6,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 30,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: const BorderSide(
                              width: 4,
                              color: Color(0xffF2A261),
                            ),
                            shadowColor: const Color(0xFF271B0F),
                          ),
                          onPressed: () {
                            quizController.fetchQuestions(
                                category.id, category.name);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryPage(
                                        categoryName: category.name,
                                        categoryId: category.id,
                                      )),
                            );
                          },
                          child: Text(
                            category.name,
                            style: const TextStyle(
                              fontFamily: 'BalooBhaijaan',
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              decorationThickness: 2.0,
                              color: Color(0xFF793C0B),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 50),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
