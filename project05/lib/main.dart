import 'package:flutter/material.dart';
import 'tictactoe.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.yellow, Colors.green, Colors.blue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: const TicTacToe(),
      ),
    ),
  ));
}
