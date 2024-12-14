import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:educagame/controller/auth_controller.dart';
import 'package:educagame/app/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        // Verifica se o usuário já está autenticado
        if (authController.isLoggedIn.value) {
          return const HomePage();
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
            backgroundColor: const Color(0xFFFFB405),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    authController.login(emailController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF793C0B),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Login com Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    authController.loginAnonymously();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB405),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Entrar sem email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => authController.isLoading.value
                      ? const CircularProgressIndicator()
                      : const SizedBox.shrink(),
                ),
                Obx(
                  () => authController.errorMessage.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            authController.errorMessage.value,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
