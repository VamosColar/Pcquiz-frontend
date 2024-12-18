import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:educagame/controller/auth_controller.dart';
import 'package:educagame/app/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final AuthController authController = Get.put(AuthController());
  final TextEditingController identifyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        // Verifica se o usuário já está autenticado
        if (authController.isLoggedIn.value) {
          return const HomePage();
        }

        return Scaffold(
          backgroundColor: const Color(0xFFFED295), // Fundo claro

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 200),
                  Center(
                    child: Image.asset(
                      'assets/images/apresentacao_agente.png',
                      height: 220,
                    ),
                  ),
                  const SizedBox(height: 60),

                  TextField(
                    controller: identifyController,
                    decoration: InputDecoration(
                      labelText: 'Digite seu email',
                      hintText: 'Digite seu email ',
                      labelStyle: const TextStyle(
                        color: Color(0xFFD06D0B),
                        fontSize: 18,
                        fontFamily: 'BalooThambi',
                      ),
                      filled: true,
                      fillColor: const Color(0xFFFED295),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      backgroundColor: const Color(0xFFFFC645),
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
                      authController.setIdentify(identifyController.text);
                    },
                    child: const Text(
                      'Entrar com Email',
                      style: TextStyle(
                        fontFamily: 'BalooThambi',
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        decorationThickness: 2.0,
                        color: Color(0xFFC64601),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  //Entrar sem Email
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      backgroundColor: const Color(0xFFFFEEC7),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(width: 4, color: Colors.white),
                      shadowColor: const Color(0xFFD06D0B),
                    ),
                    onPressed: () async {
                      authController.loginAnonymously();
                    },
                    child: const Text(
                      'Entrar sem Email',
                      style: TextStyle(
                        fontFamily: 'BalooThambi',
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        decorationThickness: 2.0,
                        color: Color(0xFFD06D0B),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
