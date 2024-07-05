class Question {
  final String id;
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final String imageUrl;
  final String category;

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.imageUrl,
    required this.category,
  });
}
