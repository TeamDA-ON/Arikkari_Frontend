class Spelling_Quiz {
  String problem;
  String answer;
  String description;
  int? difficulty;
  
  Spelling_Quiz({required this.problem, required this.answer, required this.description, required this.difficulty});

  Spelling_Quiz.fromMap(Map<String, dynamic> map)
      : problem = map['problem'],
        answer = map['answer'],
        difficulty = map['difficulty'],
        description = map['description'];
}