import 'package:flutter/material.dart';
import 'package:project03/quizpage1.dart';

class StartScreen extends StatelessWidget {
  //this means that it does not mantain any mutable widget
  const StartScreen({super.key}); //constructor for StartScreen

  @override //this means that the build method is overriding build method in superclass ('Stateless Widget')
  Widget build(BuildContext context) {
    //the build method describes how to display the widget in terms of other lower level widget
    return Center(
      //the centre widget centres the child widget within itself
      child: Column(
        //column widget arranges the child widgets vertically
        mainAxisSize: MainAxisSize
            .min, //this tells the column to occupy space as much as needed by its children
        children: [
          const SizedBox(
              height:
                  80), //the sizedbox of height 80 pixels is used for spacing
          const Text(
            //widget used for displaying text
            'Learning Flutter right now on my own',
            style: TextStyle(
              //style of text
              color: Colors.black12,
              fontSize: 28,
            ),
          ),
          const SizedBox(
              height: 50), //used for spacing between the text and the button
          OutlinedButton.icon(
            //button with an outlined border and an icon
            onPressed: () {
              //anonyms function triggered when button is pressed
              //navigate to QuizPage1
              Navigator.push(
                  context, //method used to navigate to new route by pushing it to the navigation stack
                  MaterialPageRoute(
                      //route that uses matrial page transition, it takes a 'builder' function that returns the widget to display
                      builder:
                          (context) => //this builder function returns the 'quizPage' widget
                              const QuizPage1()));
            },
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors
                    .white), //sets the foreground color of the button to white
            icon: const Icon(Icons.arrow_right_alt), //adds the icon
            label: const Text(
                'lets have some fun on our own'), //adds the text to the button
          ),
        ],
      ),
    );
  }
}
