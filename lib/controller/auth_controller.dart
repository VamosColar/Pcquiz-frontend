import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var identify =
      ''.obs; // Armazena o identify de informado pelo user ou deixa 'anonimo'

  // Define o identify (opcional)
  void setIdentify(String value) {
    identify.value = value;
    isLoggedIn.value =
        value.isNotEmpty; // Considera o usuário logado após definir identify
  }

  void loginAnonymously() {
    identify.value = 'anonimo';
    isLoggedIn.value = true;
    Get.offAllNamed('/home');
  }

  void logout() {
    isLoggedIn.value = false;
    identify.value = '';
    Get.offAllNamed('/');
  }
}
