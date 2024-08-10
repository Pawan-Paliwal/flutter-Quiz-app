import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswer, required this.onStart});

  final List<String> choosenAnswer;
  final void Function() onStart;

  List<Map<String, Object>> getsummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'questions': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getsummaryData();
    final totalQuestion = questions.length;
    final totalAnswer = summarydata.where((item) {
      return item['user_answer'] == item['correct_answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $totalAnswer  out of $totalQuestion questions  correctly !',
              style: TextStyle(color: Colors.white, fontSize: 17),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summarydata: summarydata),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: onStart,
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                icon: Icon(Icons.refresh),
                label: const Text('restart quiz'))
          ],
        ),
      ),
    );
  }
}
