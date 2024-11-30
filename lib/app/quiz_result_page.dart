import 'package:educagame/app/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizResultPage extends StatelessWidget {
  final int score;

  const QuizResultPage({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultado"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sua pontuação foi: $score",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.offAll(() => QuizPage()),
              child: const Text("Recomeçar"),
            ),
          ],
        ),
      ),
    );
  }
}
