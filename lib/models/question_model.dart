class Question {
  final String title;
  final String fase;
  final String mission; //tema da fase
  final String explanation; // Explicação para respostas correta
  final String imagePath; // Caminho para a imagem da fase
  final List<String>
      incorrectExplanations; // Lista de explicações das respostas incorretas

  final List<String> options;
  final int correctAnswerIndex;
  bool hasAnswered = false;

  Question({
    required this.title,
    required this.fase,
    required this.mission,
    required this.explanation,
    required this.incorrectExplanations,
    required this.options,
    required this.imagePath,
    required this.correctAnswerIndex,
  });
}
