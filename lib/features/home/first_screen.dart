import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key, required this.startQuizz});

  final void Function() startQuizz;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 200,
              color: const Color.fromARGB(150, 250, 250, 250),
            ),
            const SizedBox(
              height: 30,
            ),
            Text("Learn Flutter the fun way!",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                )
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
                onPressed: startQuizz,
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    surfaceTintColor: Colors.white
                ),
                icon: const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                  size: 30,
                ),
                label: const Text(
                    "Start Quizz",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                )
            )
          ],
        )
    );
  }
}
