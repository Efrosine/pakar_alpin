class Question {
  Question({required this.question, required this.options});

  final List<String> options;
  final String question;
}

List<Question> listQuestions = [
  Question(
    question: 'Bagaimana kondisi kulit anda ?',
    options: ['Kulit kasar', 'Kulit normal', 'Kulit halus'],
  ),
  Question(
    question: 'Apakah anda berjeraawt ?',
    options: ['Tidak berjerawat', 'Berjerawat'],
  ),
  Question(
    question: 'Apakah kulit anda kusam ?',
    options: ['Kulit Kusam', 'Kulit tidak kusam', 'Kulit cerah'],
  ),
];
