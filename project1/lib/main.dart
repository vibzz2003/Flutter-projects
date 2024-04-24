import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project01',
      theme: ThemeData(
        hoverColor: Colors.lime,
        colorScheme: const ColorScheme.light(brightness: Brightness.light)
            .copyWith(background: Colors.deepPurple),
      ),
      home: Myproject(),
    );
  }
}

class Myproject extends StatelessWidget {
  Myproject({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image from web'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://via.placeholder.com/200',
              width: 200,
              height: 200,
              loadingBuilder: (context, child, loadingProgress) {
                return loadingProgress == null
                    ? child
                    : const LinearProgressIndicator();
              },
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {},
              child: const Text('Text Button'),
            )
          ],
        ),
      ),
    );
  }
}
