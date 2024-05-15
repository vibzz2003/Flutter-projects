import 'package:flutter/material.dart';
import 'package:project03/quizpage1.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 80),
          const Text(
            'Learning Flutter right now on my own',
            style: TextStyle(
              color: Colors.black12,
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
            onPressed: () {
              //navigate to QuizPage1
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const QuizPage1()));
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('lets have some fun on our own'),
          ),
        ],
      ),
    );
  }
}
