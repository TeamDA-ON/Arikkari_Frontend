class Voca_Quiz {
  int id;
  String difficulty;
  String problem;
  String selection1;
  String selection2;
  String selection3;
  int answer;
  String commentary;

  Voca_Quiz({
    required this.id,
    required this.difficulty,
    required this.problem,
    required this.selection1,
    required this.selection2,
    required this.selection3,
    required this.answer,
    required this.commentary,
  });

  Voca_Quiz.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        difficulty = map['difficulty'],
        problem = map['problem'],
        selection1 = map['selection1'],
        selection2 = map['selection2'],
        selection3 = map['selection3'],
        answer = map['answer'],
        commentary = map['commentary'];
}
