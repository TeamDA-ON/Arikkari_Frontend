class Spelling_Quiz {
  int id;
  String difficulty;
  String answer;
  String problem1;
  String problem2;
  String commentary;

  Spelling_Quiz({
    required this.id,
    required this.difficulty,
    required this.answer,
    required this.problem1,
    required this.problem2,
    required this.commentary,
  });

  Spelling_Quiz.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        difficulty = map['difficulty'],
        answer = map['answer'],
        problem1 = map['problem1'],
        problem2 = map['problem2'],
        commentary = map['commentary'];

  Spelling_Quiz.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        difficulty = json['difficulty'],
        answer = json['answer'],
        problem1 = json['problem1'],
        problem2 = json['problem2'],
        commentary = json['commentary'];
}

// class Spelling_Quiz {
//   int id;
//   String difficulty;
//   String answer;
//   String problem1;
//   String problem2;
//   String commentary;

//   Spelling_Quiz({
//     required this.id,
//     required this.difficulty,
//     required this.answer,
//     required this.problem1,
//     required this.problem2,
//     required this.commentary,
//   });
//   factory Spelling_Quiz.fromJson(Map<String, dynamic> json) {
//     return Spelling_Quiz(
//         id: json['id'],
//         difficulty: json['difficulty'],
//         answer: json['answer'],
//         problem1: json['problem1'],
//         problem2: json['problem2'],
//         commentary: json['commentary']);
//   }
// }
