import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() => _QuizState();
}

class _QuizState extends State<quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'home-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void Restart() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }

  void addToSelectedAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    if (activeScreen == 'home-screen') {
      screenWidget = Home(switchScreen);
    } else if (activeScreen == 'question-screen') {
      screenWidget = question(selectAnswer: addToSelectedAnswer);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswer: selectedAnswer,
        onStart: Restart,
      );
    } else {
      screenWidget = Home(switchScreen);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.deepPurple,
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
