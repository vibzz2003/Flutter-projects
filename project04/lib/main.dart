import 'package:flutter/material.dart';
import 'startscreen.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple, Colors.pink],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: const StartScreen(),
      ),
    ),
  ));
}
