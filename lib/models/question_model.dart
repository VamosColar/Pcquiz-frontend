class Question {
  final String title;
  final String theme; //tema da fase
  final String explanation; // Explicação para respostas erradas
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.title,
    required this.theme,
    required this.explanation,
    required this.options,
    required this.correctAnswerIndex,
  });
}
