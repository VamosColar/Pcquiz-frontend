import 'package:educagame/controller/quiz_controller.dart';
import 'package:educagame/app/category_page.dart';
import 'package:educagame/controller/auth_controller.dart';
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
        backgroundColor: const Color(0xFFFFB405),
        foregroundColor: const Color.fromARGB(255, 152, 55, 55),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.share),
            backgroundColor: const Color(0xFFFFB405),
            foregroundColor: const Color(0xff793C0B),
            onTap: () => print('Compartilhar'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.help_outline, size: 30),
            backgroundColor: const Color(0xFFFFB405),
            foregroundColor: const Color(0xff793C0B),
            onTap: () => print('Ajuda'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.logout),
            backgroundColor: const Color(0xFFFFB405),
            foregroundColor: const Color(0xff793C0B),
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
          child: Obx(() {
            if (quizController.isLoading.value) {
              return const CircularProgressIndicator();
            }

            if (quizController.categories.isEmpty) {
              return const Text(
                "Nenhuma categoria disponível",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/agente.png'),
                const SizedBox(height: 20),
                ...quizController.categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                          color: Color(0xff793C0B),
                        ),
                        shadowColor: const Color(0xFF271B0F),
                      ),
                      onPressed: () {
                        quizController.fetchQuestions(category.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryPage(
                                    categoryName: category
                                        .name, // Passando o nome da categoria
                                    categoryId: category.id,
                                  ) // Passando o ID da categoria),
                              ),
                        );
                      },
                      child: Text(
                        category.name,
                        style: const TextStyle(
                          fontFamily: 'BalooBhaijaan',
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          decorationThickness: 2.0,
                          color: Color(0xFF793C0B),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
