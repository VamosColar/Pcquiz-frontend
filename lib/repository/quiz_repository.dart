import 'package:educagame/models/category_model.dart';
import 'package:educagame/models/question_model.dart';
import 'package:educagame/services/quiz_service.dart';

class QuizRepository {
  final QuizService quizService;

  QuizRepository({required this.quizService});

  // Busca categorias da API
  Future<List<Category>> fetchCategories() async {
    return await quizService.fetchCategories();
  }

  // Busca perguntas de uma categoria
  Future<List<Question>> fetchQuestionsByCategory(int categoryId) async {
    return await quizService.getQuestionsByCategory(categoryId);
  }

  // Envia a resposta da questão
  Future<void> submitAnswer({
    required bool isCorrect,
    required int questionId,
    required int optionId,
    required String identify,
  }) async {
    return await quizService.submitAnswer(
      isCorrect,
      questionId: questionId,
      optionId: optionId,
      identify: identify,
    );
  }
}









//   List<Question> getQuestions() {
//     return [
//       Question(
//         mission: "Missäo Segurança",
//         fase: "O Estranho no Parque",
//         imagePath: 'assets/images/man.png',
//         title:
//             "Ana está brincando no parque quando um estranho oferece doces e pede para ela ir conhecer seus gatinhos. O que Ana deve fazer?",
//         explanation:
//             "Muito bem! É importante nunca ir com estranhos e sempre procurar ajuda de adultos de confiança.",
//         options: [
//           OptionWithExplanation(
//             option: "Aceitar os doces e ir ver os gatinhos.",
//             explanation:
//                 "Nunca devemos aceitar convites de estranhos, mesmo que pareçam legais.",
//           ),
//           OptionWithExplanation(
//             option:
//                 "Agradecer, mas dizer não e procurar um adulto de confiança.",
//             explanation:
//                 "Muito bem! É importante nunca ir com estranhos e procurar ajuda de adultos de confiança.",
//           ),
//           OptionWithExplanation(
//             option: "Conversar com o estranho para não ser mal educada.",
//             explanation:
//                 "Não devemos dar informações ou conversar com estranhos.",
//           ),
//         ],
//         correctAnswerIndex: 1,
//       ),
//       // fase 2
//       Question(
//         mission: "Missão Segurança",
//         fase: "O Segredo",
//         imagePath: 'assets/images/segredo.png',
//         title:
//             "João ganhou um presente de um familiar que pediu para manter segredo dos pais. O que João deve fazer?",
//         explanation:
//             "Excelente! Não devemos guardar segredos de adultos, mesmo que sejam familiares. Seus pais precisam saber.",
//         options: [
//           OptionWithExplanation(
//             option: "Guardar o segredo para não magoar o familiar.",
//             explanation:
//                 "Lembre-se: Segredos que adultos pedem para esconder dos pais nunca são bons segredos",
//           ),
//           OptionWithExplanation(
//             option: "Contar para os pais imediatamente.",
//             explanation:
//                 "Excelente! Não devemos guardar segredos de adultos, mesmo que sejam familiares. Seus pais precisam saber.",
//           ),
//           OptionWithExplanation(
//             option: "Só contar se o presente for algo ruim.",
//             explanation:
//                 "Lembre-se2: Segredos que adultos pedem para esconder dos pais nunca são bons segredos",
//           ),
//         ],
//         correctAnswerIndex: 1,
//       ),

//       // fase 3
//       Question(
//         mission: "Missão Segurança",
//         fase: "O Cyberbullying",
//         imagePath: 'assets/images/cyberbullying.png',
//         title:
//             "Maria recebeu mensagens maldosas no celular de colegas da escola. O que ela deve fazer?",
//         explanation:
//             "Perfeito! Bullying e cyberbullying são formas de violência e devemos sempre pedir ajuda.",
//         options: [
//           OptionWithExplanation(
//             option: "Ignorar as mensagens e não contar para ninguém.",
//             explanation:
//                 "É importante não guardar isso para si mesmo nem revidar. Peça ajuda a um adulto de confiança!",
//           ),
//           OptionWithExplanation(
//             option: "Responder com mensagens maldosas também.",
//             explanation:
//                 "É importante não guardar isso para si mesmo nem revidar. Peça ajuda a um adulto de confiança!",
//           ),
//           OptionWithExplanation(
//             option: "Mostrar as mensagens para os pais ou professores.",
//             explanation:
//                 "Perfeito! Bullying e cyberbullying são formas de violência e devemos sempre pedir ajuda.",
//           ),
//         ],
//         correctAnswerIndex: 2,
//       ), // fase 4
//       Question(
//         mission: "Missão Segurança",
//         fase: "Toque Inadequado",
//         imagePath: 'assets/images/toque.png',
//         title:
//             "Alguém tocou Pedro de um jeito que o deixou desconfortável e pediu para ele não contar a ninguém. O que fazer?",
//         explanation:
//             "Exatamente! Seu corpo é seu e ninguém pode tocar você de forma inadequada. Sempre conte para alguém de confiança.",
//         options: [
//           OptionWithExplanation(
//             option: "Contar imediatamente para um adulto de confiança.",
//             explanation: " ",
//           ),
//           OptionWithExplanation(
//             option: "Guardar segredo como foi pedido.",
//             explanation:
//                 "Toques que nos deixam desconfortáveis nunca devem ser mantidos em segredo. Conte para alguém!",
//           ),
//           OptionWithExplanation(
//             option: "Esperar para ver se acontece de novo.",
//             explanation:
//                 "2Toques que nos deixa desconfortáveis nunca devem ser mantidos em segredo. Conte para alguém!",
//           ),
//         ],
//         correctAnswerIndex: 0,
//       ),
//       // fase 5
//       Question(
//         mission: "Missão Segurança",
//         fase: "Negligência",
//         imagePath: 'assets/images/negligencia.png',
//         title:
//             "Sofia percebe que sua amiga sempre vem para a escola sem lanche e às vezes com a mesma roupa por vários dias. O que fazer?",
//         explanation:
//             "Muito bem! Negligência também é uma forma de violência e precisamos ajudar nossos amigos.",
//         options: [
//           OptionWithExplanation(
//             option: "Não fazer nada, pois não é da sua conta.",
//             explanation:
//                 "Quando percebemos que um amigo pode estar sendo negligenciado, devemos avisar um adulto responsável.",
//           ),
//           OptionWithExplanation(
//             option: "Compartilhar seu lanche mas não contar para ninguém.",
//             explanation:
//                 "Quando percebemos que um amigo pode estar sendo negligenciado, devemos avisar um adulto responsável.",
//           ),
//           OptionWithExplanation(
//             option: "Contar para um professor ou responsável da escola.",
//             explanation:
//                 "Muito bem! Negligência também é uma forma de violência e precisamos ajudar nossos amigos.",
//           ),
//         ],
//         correctAnswerIndex: 2,
//       ),
//     ];
//   }
// }
