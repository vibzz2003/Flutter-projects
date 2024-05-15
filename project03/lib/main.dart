import 'package:flutter/material.dart';

import 'package:project03/start_screem.dart';

void main() {
  //entry point of the application
  runApp(MaterialApp(
    //runapp takes a widget and makes it the root of the widget tree
    //run app is called with material app, which wraps all the other several widgets commonly required for material design applications
    //matrial app is configured with home property, which specifies the widget that should be displayed when the app is launched
    home: Scaffold(
      //scaffold specifies the basic structure for the visual interface, including the AppBar, body and other visual elements
      body: Container(
          //the body of the Scaffold has Container widget, which is decorated with BoxDecoration that has a linear gradient
          decoration: const BoxDecoration(
            //used to decorate container with background
            gradient: LinearGradient(
                //creates graient effect
                colors: [Colors.blueAccent, Colors.yellowAccent],
                begin: Alignment.topLeft,
                end: Alignment.topRight),
          ),
          child: const StartScreen()),
      //inside the container child is called and is set to 'const StartsCREEN' this means that the start screen is imported from start_screen.dart
      //const keyword as widget is immutable and doesnt change
    ),
  ));
}
