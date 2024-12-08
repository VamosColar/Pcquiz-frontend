import 'package:educagame/widgets/custom_btn_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:educagame/app/quiz_page.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: const CustomBtnSpeedDial(), // settings
      backgroundColor: Colors.transparent,
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
                  border: Border.all(color: const Color(0xFF793C0B), width: 4),
                ),
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
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/persona.svg',
                    width: 350,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 8,
                  backgroundColor: const Color(0xFFFEB205),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(width: 4, color: Colors.white),
                  shadowColor: const Color(0xFF271B0F),
                ),
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
