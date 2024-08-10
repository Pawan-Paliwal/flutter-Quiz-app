class Quizquestion {
  const Quizquestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuflledAnswers() {
    final shuffledAns = List.of(answers);
    shuffledAns.shuffle();
    return shuffledAns;
  }
}
