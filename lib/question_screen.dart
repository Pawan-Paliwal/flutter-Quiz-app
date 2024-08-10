import 'package:flutter/material.dart';
import 'package:quiz_app/answer_style.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class question extends StatefulWidget {
  const question({super.key, required this.selectAnswer});
  final void Function(String answer) selectAnswer;
  @override
  State<question> createState() => _questionState();
}

class _questionState extends State<question> {
  var currentIndex = 0;
  Answerquestion(String answer) {
    widget.selectAnswer(answer);
    setState(() {
      currentIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];

    return Container(
      margin: EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuflledAnswers().map((answer) {
              return AnswerStyle(
                answer,
                () => Answerquestion(answer),
              );
            }),
          ],
        ),
      ),
    );
  }
}
