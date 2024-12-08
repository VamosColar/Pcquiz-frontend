import 'package:educagame/models/question_model.dart';

class QuizRepository {
  // TODO: trocar o mock pela API.
  List<Question> getQuestions() {
    return [
      // fase 1
      Question(
        mission: "Missäo Segurança",
        fase: "O Estranho no Parque",
        imagePath: 'assets/images/man.png',
        title:
            "Ana está brincando no parque quando um estranho oferece doces e pede para ela ir conhecer seus gatinhos. O que Ana deve fazer?",
        explanation:
            "Muito bem! É importante nunca ir com estranhos e sempre procurar ajuda de adultos de confiança.",
        incorrectExplanations: [
          "Pense novamente! Nunca devemos ir com estranhos, mesmo que pareçam legais.",
          "Conversar com o estranho para não ser mal educada.",
        ],
        options: [
          "Aceitar os doces e ir ver os gatinhos.",
          "Agradecer, mars dizer não e procurar um adulto de confiança.",
          "Conversar com o estranho para não ser mal educada.",
        ],
        correctAnswerIndex: 1,
      ),
      //fase 2
      Question(
        mission: "Missao Segurança",
        fase: "O Segredo",
        imagePath: 'assets/images/segredo.png',
        title:
            "João ganhou um presente de um familiar que pediu para manter segredo dos pais. O que João deve fazer?",
        explanation:
            "Excelente! Não devemos guardar segredos de adultos, mesmo que sejam familiares. Seus pais precisam saber.",
        incorrectExplanations: [
          "Lembre-se: Segredos que adultos pedem para esconder dos pais nunca são bons segredos",
          "Lembre-se2: Segredos que adultos pedem para esconder dos pais nunca são bons segredos",
        ],
        options: [
          "Guardar o segredo para não magoar o familiar.",
          "Contar para os pais imediatamente.",
          "Só contar se o presente for algo ruim.",
        ],
        correctAnswerIndex: 1,
      ),
      //fase3
      Question(
        mission: "Missao Segurança",
        fase: "O Cyberbullying",
        imagePath: 'assets/images/cyberbullying.png',
        title:
            "Maria recebeu mensagens maldosas no celular de colegas da escola. O que ela deve fazer?",
        explanation:
            "Perfeito! Bullying e cyberbullying são formas de violência e devemos sempre pedir ajuda.",
        incorrectExplanations: [
          "É importante não guardar isso para si mesmo nem revidar. Peça ajuda a um adulto de confiança!",
          "2 É importante não guardar isso para si mesmo nem revidar. Peça ajuda a um adulto de confiança!"
        ],
        options: [
          "Ignorar as mensagens e não contar para ninguém.",
          "Responder com mensagens maldosas também.",
          "Mostrar as mensagens para os pais ou professores.",
        ],
        correctAnswerIndex: 2,
      ),
      // fase 4
      Question(
        mission: "Missao Segurança",
        fase: "Toque Inadequado",
        imagePath: 'assets/images/toque.png',
        title:
            "Alguém tocou Pedro de um jeito que o deixou desconfortável e pediu para ele não contar a ninguém. O que fazer?",
        explanation:
            "Exatamente! Seu corpo é seu e ninguém pode tocar você de forma inadequada. Sempre conte para alguém de confiança.",
        incorrectExplanations: [
          "Toques que nos deixam desconfortáveis nunca devem ser mantidos em segredo. Conte para alguém!",
          "2Toques que nos deixam desconfortáveis nunca devem ser mantidos em segredo. Conte para alguém!",
        ],
        options: [
          "Contar imediatamente para um adulto de confiança.",
          "Guardar segredo como foi pedido.",
          "Esperar para ver se acontece de novo.",
        ],
        correctAnswerIndex: 0,
      ),
      // fase 5
      Question(
        mission: "Missao Segurança",
        fase: "Negligência",
        imagePath: 'assets/images/negligencia.png',
        title:
            "Sofia percebe que sua amiga sempre vem para a escola sem lanche e às vezes com a mesma roupa por vários dias. O que fazer?",
        explanation:
            "Muito bem! Negligência também é uma forma de violência e precisamos ajudar nossos amigos.",
        incorrectExplanations: [
          "Quando percebemos que um amigo pode estar sendo negligenciado, devemos avisar um adulto responsável.",
          "Quando percebemos que um amigo pode estar sendo negligenciado, devemos avisar um adulto responsável.",
        ],
        options: [
          "Não fazer nada, pois não é da sua conta.",
          "Compartilhar seu lanche mas não contar para ninguém.",
          "Contar para um professor ou responsável da escola.",
        ],
        correctAnswerIndex: 2,
      ),
    ];
  }
  // // Método para obter as perguntas
  // List<Question> fetchQuestions() {
  //   return _questions;
  // }
}
