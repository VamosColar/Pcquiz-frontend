// import 'package:educagame/controller/quiz_controller.dart';
// import 'package:educagame/repository/quiz_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart'; // Import do controlador criado

// class QuizAlert extends StatelessWidget {
//   final bool isCorrect; // Indica se a resposta está correta
//   final int starsEarned; // Estrelas ganhas na fase
//   final Function onNextLevel; // Função chamada ao pressionar "Próxima Fase"

//   const QuizAlert({
//     Key? key,
//     required this.isCorrect,
//     required this.starsEarned,
//     required this.onNextLevel,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Instanciando o controlador
//     final quizController =
//         Get.put(QuizController(repository: QuizRepository()));

//     // Inicia a transição de estado
//     quizController.updateToScoreView();

//     return Obx(() {
//       return Dialog(
//         backgroundColor: Colors.transparent,
//         child: quizController.showResult.value
//             ? _buildResultAlert() // Mostra feedback inicial
//             : _buildScoreAlert(), // Mostra alerta de progresso
//       );
//     });
//   }

//   // Alerta inicial mostrando se a resposta foi correta ou incorreta
//   Widget _buildResultAlert() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: isCorrect ? Colors.green : Colors.red,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             isCorrect ? Icons.check_circle : Icons.error,
//             size: 48,
//             color: Colors.white,
//           ),
//           const SizedBox(height: 16),
//           Text(
//             isCorrect ? "Resposta Correta!" : "Resposta Incorreta!",
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Segundo alerta mostrando o progresso e as estrelas ganhas
//   Widget _buildScoreAlert() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.amber[100],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text(
//             "PARABÉNS!",
//             style: TextStyle(
//               color: Colors.brown,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(
//               starsEarned,
//               (index) => const Icon(Icons.star, color: Colors.amber, size: 32),
//             ),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             "Você conquistou estrelas nesta fase!",
//             style: TextStyle(
//               color: Colors.brown,
//               fontSize: 16,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               Get.back(); // Fecha o diálogo
//               onNextLevel(); // Chama a função para ir para a próxima fase
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.orange,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text("Próxima Fase"),
//           ),
//           const SizedBox(height: 8),
//           OutlinedButton(
//             onPressed: () => Get.back(), // Fecha o diálogo
//             style: OutlinedButton.styleFrom(
//               side: const BorderSide(color: Colors.orange),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text("Sair do Jogo",
//                 style: TextStyle(color: Colors.orange)),
//           ),
//         ],
//       ),
//     );
//   }
// }
