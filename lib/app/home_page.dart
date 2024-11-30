import 'package:educagame/app/quiz_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
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
        ),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0XFF7646F0),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xFF660185),
                  width: 1,
                ),
              ),
              child: const Row(
                children: [
                  Row(
                    children: [
                      Text(
                        'xxxx ',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Text(
                    '0/5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF0467D),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xFF660185),
                  width: 1,
                ),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Color(0xffF9AF03),
                    size: 32,
                  ),
                  SizedBox(width: 20),
                  Text(
                    '0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.orangeAccent,
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
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: const Color(0xFF793C0B), width: 4)),
                child: const Text(
                  'Missão Segurança',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'BalooThambi',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF793C0B),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    'assets/images/persona.png',
                    height: 240,
                    width: 292,
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        'Opa!',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // Botão Jogar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 6,
                    backgroundColor: const Color(0xFFFEB205),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(width: 4, color: Colors.white),
                    shadowColor: const Color(0xFF271B0F)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizPage()),
                  );
                },
                child: const Text(
                  'JOGAR',
                  style: TextStyle(
                    fontFamily: 'BalooThambi',
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    decorationThickness: 2.0,
                    color: Color(0xFF271B0F),
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
