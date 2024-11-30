import 'package:educagame/models/question_model.dart';

class QuizRepository {
  // Simula uma fonte de dados, como API ou banco de dados.
  final List<Question> _questions = [
    Question(
      theme: "O Estranho no Parque",
      title:
          "Ana está brincando no parque quando um estranho oferece doces e pede para ela ir conhecer seus gatinhos. O que Ana deve fazer?",
      explanation:
          "Aceitar doces e ir com estranhos pode ser perigoso. É sempre melhor procurar um adulto de confiança.",
      options: [
        "Aceitar os doces e ir ver os gatinhos.",
        "Agradecer, mas dizer não e procurar um adulto de confiança.",
        "Conversar com o estranho para não ser mal educada.",
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      theme: "Ajude ao proximo",
      title: "Ana foi questionada . O que Ana deve fazer?",
      explanation:
          "Aceitar doces e ir com estranhos pode ser perigoso. É sempre melhor procurar um adulto de confiança.",
      options: [
        "Aceitar os doces e ir ver os gatinhos.",
        "Agradecer, mas dizer não e procurar um adulto de confiança.",
        "Conversar com o ele.",
      ],
      correctAnswerIndex: 3,
    ),
  ];

  // Método para obter as perguntas
  List<Question> fetchQuestions() {
    return _questions;
  }
}
