import 'package:flutter/material.dart';

class AnswerStyle extends StatelessWidget {
  const AnswerStyle(this.answerText, this.Ontapped, {super.key});
  final String answerText;
  final void Function() Ontapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
          ),
          onPressed: Ontapped,
          child: Text(
            answerText,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          )),
    );
  }
}
