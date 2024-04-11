import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_basics/features/quizz/components/summary_item.dart';

import '../../../data/questions.dart';

class ResultSummaryWidget extends StatelessWidget {
  const ResultSummaryWidget({super.key, required this.selectedAnswers, required this.restartQuiz});

  final List<String> selectedAnswers;
  final void Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> getSummaryResult() {
      List<Map<String, Object>> summaryResult = [];

      for (var i = 0; i < questions.length; i++) {
        summaryResult.add({
          'question_index': i + 1,
          'question': questions[i].text,
          'user_answer': selectedAnswers[i],
          'correct_answer': questions[i].answers.first
        });
      }

      return summaryResult;
    }

    List<Map<String, Object>> summaryResult = getSummaryResult();

    int totalQuestions = questions.length;
    int correctQuestions = summaryResult.where(
            (summaryItem) => summaryItem['user_answer'] == summaryItem['correct_answer']
    ).length;

    SizedBox getSummaryItems() {
      return SizedBox(
        height: 400,
        child: SingleChildScrollView(
            child: Column(
                children: summaryResult.map((data) {
          return SummaryItem(summaryItem: data);
        }).toList())),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.9,
            child: Text(
              'You answered $correctQuestions out of $totalQuestions questions correctly!',
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 230, 200, 253),
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          getSummaryItems(), // Summary Items
          TextButton.icon(
            icon: const Icon(
              Icons.restart_alt_rounded,
              color: Colors.white,
            ),
            label: const Text(
              "Restart Quizz!",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: restartQuiz
          )
        ],
      ),
    );
  }
}
