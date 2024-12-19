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
  // Buscar categorias
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
        print("Erro HTTP: \${response.statusCode} - \${response.body}");
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
        print('Erro HTTP: \${response.statusCode} - \${response.body}');
        throw Exception('Erro ao carregar perguntas da categoria');
      }
    } catch (e) {
      print('Erro ao carregar perguntas: $e');
      rethrow;
    }
  }

  // Enviar resposta
  Future<void> submitAnswer(
    bool isCorrect, {
    required int questionId,
    required int optionId,
    required String identify,
  }) async {
    final url = Uri.parse('$baseUrl/answers');
    print('Resposta da API: submitAnswer $url');
    final body = json.encode({
      'questionId': questionId,
      'optionId': optionId,
      'identify': identify, // Inclui o identify no envio
    });
    print('Resposta da API: body $body');
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      print('Resposta da API: response body $response');
      print('Resposta da API: response body 2 ${response.body}');
      if (response.statusCode == 200) {
        print('Resposta do quiz enviada com sucesso');
      } else {
        print('Erro HTTP: ${response.statusCode} - ${response.body}');
        throw Exception('Erro ao enviar resposta do quiz');
      }
    } catch (e) {
      print('Erro ao enviar resposta: $e');
      rethrow;
    }
  }

  // Enviar tentativa incorreta
  Future<void> submitIncorrectAttempt({
    required int questionId,
    required int optionId,
    required String identify,
  }) async {
    final url = Uri.parse('$baseUrl/answers');
    final body = json.encode({
      'questionId': questionId,
      'optionId': optionId,
      'identify': identify,
    });

    print('Tentativa incorreta: $body');

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        print('Tentativa incorreta registrada com sucesso');
      } else {
        print(
            'Erro HTTP ao registrar tentativa incorreta: ${response.statusCode} - ${response.body}');
        throw Exception('Erro ao registrar tentativa incorreta');
      }
    } catch (e) {
      print('Erro ao registrar tentativa incorreta: $e');
      rethrow;
    }
  }
}
