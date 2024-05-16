import 'package:flutter/material.dart';
import 'package:project03/lastpage.dart';

class QuizPage3 extends StatefulWidget {
  const QuizPage3({super.key});

  @override
  QuizPage3State createState() => QuizPage3State();
}

class QuizPage3State extends State<QuizPage3> {
  int? selectedoptionindex;
  final int correctAnswerIndex = 0;

  void selectOption(int index) {
    setState(() {
      selectedoptionindex = index;
    });
  }

  void submitAnswer() {
    if (selectedoptionindex != null) {
      bool isCorrect = selectedoptionindex == correctAnswerIndex;
      String resultMessage =
          isCorrect ? 'Correct' : 'Incorrect, please try again';
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Result'),
              content: Text(resultMessage),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (isCorrect) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FinalPage()));
                      }
                    },
                    child: const Text('OK')),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content:
                  const Text('Please select an option to submit the answer'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'))
              ],
            );
          });
    }
  }

  Widget buildOption(int index, String option) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          selectOption(index);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedoptionindex == index
                  ? Colors.blue
                  : Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            option,
            style: TextStyle(
              fontSize: 18,
              color: selectedoptionindex == index ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Question 3:'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'What is the capital of China',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            buildOption(0, 'Beijing'),
            buildOption(1, 'Delhi'),
            buildOption(2, 'Japan'),
            buildOption(3, 'Mumbai'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitAnswer,
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
