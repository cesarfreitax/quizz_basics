import 'package:flutter/material.dart';
import 'package:quizz_basics/data/questions.dart';
import 'package:quizz_basics/features/home/first_screen.dart';
import 'package:quizz_basics/features/quizz/questions_screen.dart';
import 'package:quizz_basics/features/quizz/result_screen.dart';

const String firstScreen = "FIRST_SCREEN";
const String questionsScreen = "QUESTIONS_SCREEN";
const String resultScreen = "RESULT_SCREEN";

class Quizz extends StatefulWidget {
  const Quizz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizzState();
  }
}

class _QuizzState extends State<Quizz> {
  String activeScreen = firstScreen;
  List<String> selectedAnswers = [];

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = resultScreen;
      });
    }
  }

  void startQuizz() {
    setState(() {
      activeScreen = questionsScreen;
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = firstScreen;
      selectedAnswers.clear();
    });
  }

  Widget get activeScreenWidget {
    switch (activeScreen) {
      case firstScreen:
        return FirstScreen(startQuizz: startQuizz);
      case questionsScreen:
        return QuestionsScreen(selectAnswer: selectAnswer);
      default:
        return ResultScreen(selectedAnswers: selectedAnswers, restartQuiz: restartQuiz);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.deepPurple, Colors.deepPurpleAccent])),
          child: activeScreenWidget
        ),
      ),
    );
  }
}
