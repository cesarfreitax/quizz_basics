import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_basics/components/answer_widget.dart';
import 'package:quizz_basics/data/questions.dart';
import 'package:quizz_basics/models/quizz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.selectAnswer});

  final void Function(String) selectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  int currentQuestion = 0;

  void nextQuestion() {
    setState(() {
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    QuizzQuestion activeQuestion = questions[currentQuestion];

    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                style: GoogleFonts.lato(color: const Color.fromARGB(255, 230, 200, 253), fontSize: 20, fontWeight: FontWeight.bold),
                activeQuestion.text,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...activeQuestion.shuffledAnswers.map((answer) {
                return AnswerWidget(
                    answer: answer,
                    onAnswer: () {
                      widget.selectAnswer(answer);
                      nextQuestion();
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
