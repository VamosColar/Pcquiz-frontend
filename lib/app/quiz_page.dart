import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:educagame/app/home_page.dart';
import 'package:educagame/controller/quiz_controller.dart';
import 'package:educagame/widgets/custom_btn_speed_dial.dart';
import 'package:educagame/widgets/custom_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class QuizPage extends StatelessWidget {
  QuizPage({super.key});

  // final List<Color> backgroundColors = [
  //   const Color(0xFF6EAF99),
  //   const Color(0xFF7FAF6E),
  //   const Color(0xFFD77D7D),
  //   const Color(0xFFFFF1B7),
  //   const Color(0xFFACE8E0),
  // ];
  // //Obtenho o indice da fase
  // int getColorIndex(int currentIndex) {
  //   return currentIndex % backgroundColors.length;
  // }

  @override
  Widget build(BuildContext context) {
    final QuizController quizController = Get.find<QuizController>();

    if (quizController.quizCompleted.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
      return const SizedBox();
    }

    return Obx(() {
      // final backgroundColor =
      // backgroundColors[getColorIndex(quizController.questionIndex.value)];
      // final currentQuestion = quizController.questions[quizController.questionIndex.value];

      // final backgroundColor = backgroundColors[
      //     quizController.currentPhase.value % backgroundColors.length];
      final backgroundColor = quizController.backgroundColor;
      final question =
          quizController.questions[quizController.questionIndex.value];

      return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            color: backgroundColor,
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          title: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0XFF7646F0),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xFF660185),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 2),
                      CustomProgressBar(
                        totalSteps: quizController.questions.length,
                        currentStep: quizController.questionIndex.value + 1,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "${quizController.questionIndex.value + 1}/${quizController.questions.length}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'InriaSans',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0467D),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xFF660185),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/score.svg',
                        width: 26,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "${quizController.score.value}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Color(0xFF660185),
                              offset: Offset(1.5, 1.5),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          leading: const Padding(
            padding: EdgeInsets.only(left: 6.0),
            child: CustomBtnSpeedDial(
              overlayColor: Color.fromARGB(100, 0, 0, 0),
            ),
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
          child: Obx(() {
            if (quizController.questions.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            final question =
                quizController.questions[quizController.questionIndex.value];
            final imageUrl = question.imagePath;
            return Container(
              decoration: BoxDecoration(
                color: backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          question.description.isEmpty
                              ? 'sem descrição'
                              : question.description,
                          style: const TextStyle(
                            color: Color(0xFF434342),
                            fontSize: 16,
                            fontFamily: 'BalooThambi',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white60,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Fase ${question.fase}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF434342),
                              fontSize: 20,
                              fontFamily: 'BalooThambi',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (question.imagePath != null &&
                              question.imagePath.isNotEmpty)
                            Expanded(
                              child:
                                  question.imagePath.startsWith('data:image') &&
                                          question.imagePath.contains('base64,')
                                      ? Image.memory(
                                          // Decodifica a imagem em Base64
                                          const Base64Decoder().convert(
                                            question.imagePath
                                                .split(',')
                                                .last
                                                .trim(),
                                          ),
                                          fit: BoxFit.contain,
                                          height: 200,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl: question.imagePath,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          fit: BoxFit.contain,
                                        ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2A557),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFF9A8670),
                            width: 8.0,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '?',
                              style: TextStyle(
                                fontFamily: 'AbhayaLibre-ExtraBold',
                                fontSize: 126,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffDE3400),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                question.title,
                                softWrap: true,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF271B0F),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ...List.generate(question.options.length, (index) {
                        return Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                        width: 4, color: Color(0xFF793C0B)),
                                  ),
                                ),
                                onPressed: () {
                                  quizController.checkAnswer(context, index);
                                },
                                child: Text(
                                  question.options[index].resposta,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
