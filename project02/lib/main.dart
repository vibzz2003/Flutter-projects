import 'package:flutter/material.dart';

import 'package:project02/start_screen.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.purple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
          child: const StartScreen()),
    ),
  ));
}
