import 'dart:convert';
import 'package:educagame/models/category_model.dart';
import 'package:educagame/models/question_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class QuizService {
  final String baseUrl;
  final String token;

  QuizService({required this.baseUrl, required this.token});

  Map<String, String> get headers => {
        'x-api-token': token,
        'Content-Type': 'application/json',
      };
  Future<List<Category>> fetchCategories() async {
    final url = '$baseUrl/categories';
    print("Resposta da url: $url");
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Resposta da API: $data");
        return (data['message'] as List)
            .map((category) => Category.fromJson(category))
            .toList();
      } else {
        print("Headers enviados: $headers");

        print("Erro HTTP: ${response.statusCode} - ${response.body}");
        throw Exception('Erro ao carregar categorias');
      }
    } catch (e) {
      print("Headers enviados2: $headers");

      print("Erro ao carregar categorias2: $e");
      rethrow;
    }
  }

  // Buscar perguntas por categoria
  Future<List<Question>> getQuestionsByCategory(int categoryId) async {
    final url = '$baseUrl/categories/$categoryId';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Resposta da API: $data');
        final List<dynamic> questionsJson = data['message'];
        return questionsJson.map((q) => Question.fromJson(q)).toList();
      } else {
        print('Erro HTTP: ${response.statusCode} - ${response.body}');
        throw Exception('Erro ao carregar perguntas da categoria');
      }
    } catch (e) {
      print('Erro ao carregar perguntas: $e');
      rethrow;
    }
  }

  // Enviar resposta
  Future<void> submitAnswer(bool isCorrect) async {
    final url = Uri.parse('$baseUrl/answers');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'isCorrect': isCorrect}),
    );

    if (response.statusCode != 200) {
      print('Erro ao enviar resposta');
      throw Exception('Erro ao enviar resposta');
    }
  }
}
