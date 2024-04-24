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
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          child: const Text('Lets have fun'),
        ),
      ],
    ));
  }
}
