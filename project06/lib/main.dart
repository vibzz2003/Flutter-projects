import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:project06/screens/categories.dart';

final theme = ThemeData(
  //makes a themedata object and assigns it to the variable theme. Themedata is a class
  useMaterial3:
      true, //enables materialdesign 3 which is a google new design system
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57,
        0), //seedcolor is a primamry color from which pallete is derived
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const CategoriesScreen(),
    );
  }
}
