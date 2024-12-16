import 'package:educagame/app/login_page.dart';
import 'package:educagame/controller/auth_controller.dart';
import 'package:educagame/controller/quiz_controller.dart';
import 'package:educagame/repository/quiz_repository.dart';
import 'package:educagame/services/quiz_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final baseUrl = dotenv.env['BASE_URL'];
  final apiToken = dotenv.env['API_TOKEN'];

  if (baseUrl == null || apiToken == null) {
    throw Exception(
        "BASE_URL ou API_TOKEN não foram encontrados no arquivo .env");
  }
  Get.put(AuthController());
  Get.put(
    QuizController(
      repository: QuizRepository(
        quizService: QuizService(
          baseUrl: baseUrl,
          token: apiToken,
        ),
      ),
      quizService: QuizService(
        baseUrl: baseUrl,
        token: apiToken,
      ),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pc Quiz',
      home: LoginPage(),
    );
  }
}
