import 'package:flutter/material.dart';
import 'package:project04/todo.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 70),
          const Text(
            'To Do List',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TodoListPage()));
              },
              icon: const Icon(Icons.add),
              label: const Text('Lets make a TO DO LIST')),
        ],
      ),
    );
  }
}
