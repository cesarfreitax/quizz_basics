import 'package:flutter/material.dart';
import 'package:quizz_basics/features/quizz/components/result_summary_widget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.selectedAnswers, required this.restartQuiz});

  final List<String> selectedAnswers;
  final void Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(child: ResultSummaryWidget(selectedAnswers: selectedAnswers, restartQuiz: restartQuiz));
  }
}
