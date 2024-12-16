class Option {
  final int id;
  final String resposta;
  final String explanation;
  bool isCorrect;

  Option({
    required this.id,
    required this.resposta,
    required this.explanation,
    this.isCorrect = false,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      resposta: json['resposta'],
      explanation: json['explanation'],
    );
  }
  // Instância de fallback
  static Option empty() {
    return Option(
      id: -1,
      resposta: '',
      explanation: '',
      isCorrect: false,
    );
  }
}
