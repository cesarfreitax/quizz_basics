import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_basics/features/quizz/components/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.summaryItem
  });

  final Map<String, Object> summaryItem;

  @override
  Widget build(BuildContext context) {

    final bool isCorrectAnswer = summaryItem['user_answer'] == summaryItem['correct_answer'];
    final int questionIndex = summaryItem['question_index'] as int;
    final String question = summaryItem['question'] as String;
    final String userAnswer = summaryItem['user_answer'] as String;
    final String correctAnswer = summaryItem['correct_answer'] as String;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(isCorrectAnswer: isCorrectAnswer, questionIndex: questionIndex),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 5
              ),
              Text(
                userAnswer,
                style: const TextStyle(
                    color: Color.fromARGB(
                        255, 202, 171, 252
                    )
                ),
              ),
              Text(
                correctAnswer,
                style: const TextStyle(
                    color: Color.fromARGB(255, 181, 254, 246)
                ),
              )
            ],
          ),
        )
      ],
    );
  }

}