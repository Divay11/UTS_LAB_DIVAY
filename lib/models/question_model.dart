class Question {
  final String questionText;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctIndex,
  });
}

List<Question> sampleQuestions = [
  Question(
    questionText: "Apa ibu kota Indonesia?",
    options: ["Medan", "Jakarta", "Surabaya", "Bandung"],
    correctIndex: 1,
  ),
  Question(
    questionText: "Flutter menggunakan bahasa pemrograman apa?",
    options: ["Dart", "Kotlin", "Swift", "JavaScript"],
    correctIndex: 0,
  ),
  Question(
    questionText: "Widget yang tidak memiliki state disebut?",
    options: ["StatelessWidget", "StatefulWidget", "Provider", "Container"],
    correctIndex: 0,
  ),
];
