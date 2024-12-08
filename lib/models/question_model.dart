class Question {
  final String title;
  final String fase;
  final String mission;
  final String explanation; // Explicação correta
  final String imagePath;
  final List<OptionWithExplanation>
      options; // Nova estrutura para vincular opções e explicações
  final int correctAnswerIndex;

  Question({
    required this.title,
    required this.fase,
    required this.mission,
    required this.explanation,
    required this.imagePath,
    required this.options,
    required this.correctAnswerIndex,
    bool hasAnswered = false,
  });
}

class OptionWithExplanation {
  final String option; // Texto da opção
  final String explanation; // Explicação associada

  OptionWithExplanation({
    required this.option,
    required this.explanation,
  });
}
