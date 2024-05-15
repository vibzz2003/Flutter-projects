import 'package:flutter/material.dart';

class QuizPage2 extends StatefulWidget {
  const QuizPage2({super.key});

  @override
  QuizPage2State createState() => QuizPage2State();
}

class QuizPage2State extends State<QuizPage2> {
  int? selectedOptionIndex;

  void selectOption(int index) {
    setState(() {
      selectedOptionIndex = index;
    });
  }

  void submitAnswer() {
    if (selectedOptionIndex != null) {
      print('Selected option is: $selectedOptionIndex');
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
                  child: const Text('OK'),
                )
              ],
            );
          });
    }
  }

  Widget buildOption(int index, String option) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          selectOption(index);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedOptionIndex == index
                  ? Colors.blue
                  : Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            option,
            style: TextStyle(
              fontSize: 18,
              color: selectedOptionIndex == index ? Colors.blue : Colors.black,
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
        title: const Text('Quiz Question 2: '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'What is the capital of India',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            buildOption(0, 'New Delhi'),
            buildOption(1, 'France'),
            buildOption(2, 'New Orleans'),
            buildOption(3, 'Kolkata'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitAnswer,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
