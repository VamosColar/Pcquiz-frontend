class Option {
  final int id;
  final String resposta;
  final String explanation;

  Option({
    required this.id,
    required this.resposta,
    required this.explanation,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      resposta: json['resposta'],
      explanation: json['explanation'],
    );
  }
}
