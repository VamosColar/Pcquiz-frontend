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
          backgroundColor: const Color(0xFFFFF8E1), // Fundo claro
          appBar: AppBar(
            title: const Text(
              'Bem-Vindo ao PcQuiz',
              style: TextStyle(
                  fontFamily: 'BalooThambi',
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                  color: Color(0xFFD06D0B)),
            ),
            backgroundColor: const Color(0xFFFFB405),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 90),
                  Center(
                    child: Image.asset(
                      'assets/images/apresentacao_agente.png',
                      height: 150,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Para começar informe seu e-mail ou continue anonimamente!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'BalooThambi',
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 30),

                  TextField(
                    controller: identifyController,
                    decoration: InputDecoration(
                      labelText: 'Digite seu email',
                      hintText: 'Digite seu email ou deixe em branco',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: 'BalooThambi',
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.email, color: Colors.orange),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
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
                      authController.setIdentify(identifyController.text);
                    },
                    child: const Text(
                      'Entrar com Email',
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
                  //Entrar sem Email
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      backgroundColor: const Color(0xFFFFB300),
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
                        color: Colors.black87,
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
