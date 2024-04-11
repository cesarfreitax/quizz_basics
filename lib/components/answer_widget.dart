import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({super.key, required this.answer, required this.onAnswer});

  final String answer;
  final void Function() onAnswer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white
        ),
        onPressed: onAnswer,
        child: Text(
            answer,
            textAlign: TextAlign.center,
        )
    );
  }

}