import 'dart:convert';

import 'package:educagame/models/option_model.dart';
import 'package:flutter/services.dart';

class Question {
  final int id;
  final String title;
  final String description;
  final int fase;
  final String mission;
  final String explanation;
  final String imagePath;
  final List<Option> options;
  final int correctAnswerIndex;

  Question({
    required this.id,
    required this.title,
    required this.description,
    required this.fase,
    required this.mission,
    required this.explanation,
    required this.imagePath,
    required this.options,
    required this.correctAnswerIndex,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      title: json['title'],
      description: json['description'] ?? '',
      fase: json['fase'],
      mission: json['mission'] ?? '', // Campo opcional
      explanation: json['explanation'] ?? '', // Campo opcional
      imagePath: json['imagePath'] ?? '', // Campo opcional
      options: List<Option>.from(
        json['options'].map((option) => Option.fromJson(option)),
      ),
      correctAnswerIndex: json['correctAnswerIndex'],
    );
  }
  Uint8List? get decodedImage {
    if (imagePath.isNotEmpty) {
      final base64String = imagePath.split(',').last;
      return base64Decode(base64String);
    }
    return null;
  }
}
