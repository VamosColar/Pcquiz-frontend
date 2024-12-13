import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  /// Método de login usando e-mail
  Future<void> login(String email) async {
    const url = 'https://pcquiz.tfos.com.br/api/login';
    final token = dotenv.env['API_TOKEN'];

    if (token == null) {
      errorMessage.value = 'Token não configurado no .env';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({'email': email}),
      );

      if (response.statusCode == 200) {
        isLoggedIn.value = true;
        Get.offAllNamed('/home');
      } else {
        final responseBody = json.decode(response.body);
        errorMessage.value = responseBody['message'] ?? 'Erro desconhecido.';
      }
    } catch (e) {
      errorMessage.value = 'Erro ao tentar logar: $e';
    } finally {
      isLoading.value = false;
    }
  }

  /// Login anônimo
  void loginAnonymously() {
    isLoggedIn.value = true;
    Get.offAllNamed('/home');
  }

  /// Logout do sistema
  void logout() {
    isLoggedIn.value = false;
    Get.offAllNamed('/login');
  }
}
