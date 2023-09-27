import 'dart:convert';
import 'package:flutter_project/model/model_spellingQuiz.dart';

List<Spelling_Quiz> parseQuestions(dynamic jsonStr) {
  final parsed = jsonDecode(jsonStr).cast<Map<String, dynamic>>();
  return parsed
      .map<Spelling_Quiz>((json) => Spelling_Quiz(
            id: json['id'],
            difficulty: json['difficulty'],
            answer: json['answer'],
            problem1: json['problem1'],
            problem2: json['problem2'],
            commentary: json['commentary'],
          ))
      .toList();
}
