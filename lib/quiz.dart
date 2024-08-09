import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/question_screen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  var activeScreen = 'home-screen';

  void switchscreen() {
    setState(() {
      activeScreen = 'question-screeen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.deepPurple,
          ),
          child: activeScreen == 'home-screen'
              ? Home(switchscreen)
              : const question(),
        ),
      ),
    );
  }
}
