// import 'package:educagame/app/quiz_page.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color(0xFFFFB405),
//                 Color(0xffE8930A),
//               ],
//             ),
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//               decoration: BoxDecoration(
//                 color: const Color(0XFF7646F0),
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(
//                   color: const Color(0xFF660185),
//                   width: 1,
//                 ),
//               ),
//               child: const Row(
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         'xxxx ',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     '0/5',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 28,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 10,
//                 vertical: 5,
//               ),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF0467D),
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(
//                   color: const Color(0xFF660185),
//                   width: 1,
//                 ),
//               ),
//               child: const Row(
//                 children: [
//                   Icon(
//                     Icons.star,
//                     color: Color(0xffF9AF03),
//                     size: 32,
//                     shadows: [
//                       Shadow(
//                         blurRadius: 2.0,
//                         color: Colors.white,
//                         offset: Offset(1.5, 1.5),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 20),
//                   Text(
//                     '0',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 28,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.transparent,
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xFFFFB405),
//               Color(0xffE8930A),
//             ],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     border:
//                         Border.all(color: const Color(0xFF793C0B), width: 4)),
//                 child: const Text(
//                   'Missão Segurança',
//                   style: TextStyle(
//                     fontSize: 26,
//                     fontFamily: 'BalooThambi',
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xFF793C0B),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 50),

//               Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   Image.asset(
//                     'assets/images/persona.png',
//                     height: 240,
//                     width: 292,
//                   ),
//                   Positioned(
//                     top: 0,
//                     child: Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Text(
//                         'Eu sou a agente Sofia. Vem me ajudar a salvar seus colegas de escola que podem estar enfrentando violência. Mas cuidado! Nem sempre os sinais são fáceis de perceber, e é preciso estar atento, observar e tomar decisões rápidas e certeiras para proteger seus amigos.',
//                         style: TextStyle(fontSize: 16, color: Colors.black),
//                         softWrap: true,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 50),

//               // Botão Jogar
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     elevation: 6,
//                     backgroundColor: const Color(0xFFFEB205),
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 15, horizontal: 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     side: const BorderSide(width: 4, color: Colors.white),
//                     shadowColor: const Color(0xFF271B0F)),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const QuizPage()),
//                   );
//                 },
//                 child: const Text(
//                   'JOGAR',
//                   style: TextStyle(
//                     fontFamily: 'BalooThambi',
//                     fontSize: 40,
//                     fontWeight: FontWeight.w400,
//                     decorationThickness: 2.0,
//                     color: Color(0xFF271B0F),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:educagame/app/mission_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSettingsExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: SpeedDial(
        overlayColor: Color.fromARGB(255, 61, 45, 9),
        direction: SpeedDialDirection.down,
        backgroundColor: const Color(0xFFFFB405),
        foregroundColor: const Color.fromARGB(255, 152, 55, 55),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.share),
            backgroundColor: const Color(0xFFFFB405),
            foregroundColor: const Color(0xff793C0B),
            onTap: () => print('Compartilhar'),
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.help_outline,
              size: 30,
            ),
            backgroundColor: const Color(0xFFFFB405),
            foregroundColor: const Color(0xff793C0B),
            onTap: () => print('Sair'),
          ),
          SpeedDialChild(
            backgroundColor: const Color(0xFFFFB405),
            foregroundColor: const Color(0xff793C0B),
            child: const Icon(Icons.notifications_off_sharp),
            onTap: () => print('notifications'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.output_rounded),
            backgroundColor: const Color(0xFFFFB405),
            foregroundColor: const Color(0xff793C0B),
            onTap: () => print('Sair'),
          ),
        ],
        child: const Icon(
          Icons.settings,
          size: 30,
          color: Color(0xFFDE3400),
          shadows: [
            Shadow(
              blurRadius: 4.0,
              color: Color(0xffFAE7CD),
              offset: Offset(2.0, 1.0),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFB405),
              Color(0xffE8930A),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/agente.png'),

              const SizedBox(height: 20),

              // Botões das missões
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 6,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(width: 4, color: Color(0xff793C0B)),
                    shadowColor: const Color(0xFF271B0F)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MissionPage()),
                  );
                },
                child: const Text(
                  'Missão Segurança',
                  style: TextStyle(
                    fontFamily: 'BalooBhaijaan',
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    decorationThickness: 2.0,
                    color: Color(0xFF793C0B),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 6,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 42),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(width: 4, color: Color(0xff793C0B)),
                    shadowColor: const Color(0xFF271B0F)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MissionPage()),
                  );
                },
                child: const Text(
                  'Missão Proteção',
                  style: TextStyle(
                    fontFamily: 'BalooBhaijaan',
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    decorationThickness: 2.0,
                    color: Color(0xFF793C0B),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
