import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      //mulptiple widgets above each other
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/image1.png',
          width: 300,
          height: 300,
          color: const Color.fromARGB(226, 146, 138, 138),
        ),
        const SizedBox(height: 80),
        const Text(
          'Learning flutter the minion way!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 50),
        OutlinedButton.icon(
          onPressed: () {},
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Lets have fun'),
        ),
      ],
    ));
  }
}
