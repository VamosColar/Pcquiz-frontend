import 'package:flutter/material.dart';

class FeedbackCard extends StatelessWidget {
  final bool isCorrect; // Define se o feedback é positivo ou negativo
  final String title; // Título do feedback
  final String message; // Mensagem explicativa

  const FeedbackCard({
    Key? key,
    required this.isCorrect,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
          isCorrect ? const Color(0xFF4A7B0F) : const Color(0xFF7B0F0F),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isCorrect ? const Color(0xFF84E760) : const Color(0xFFFF2103),
          width: 4,
        ),
      ),
      title: Row(
        children: [
          Icon(
            isCorrect ? Icons.star : Icons.error_outline,
            color: const Color(0xffF9AF03),
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'OKrrr',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
