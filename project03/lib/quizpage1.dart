import 'package:flutter/material.dart';
import 'package:project03/quizpage2.dart';

class QuizPage1 extends StatefulWidget {
  //means it can mantain and update the widgets state
  const QuizPage1({super.key}); //constructor for the widget

  @override
  QuizPage1State createState() =>
      QuizPage1State(); //creating instance of the state class
}

class QuizPage1State extends State<QuizPage1> {
  int?
      selectedOptionIndex; //this variable holds the index of selected option, it is nullable if no option is selected

  void selectOption(int index) {
    //method to set the selectedoptionindex to the provided index and calls 'setState' to update the UI
    setState(() {
      selectedOptionIndex = index;
    });
  }

  void submitAnswer() {
    //checks if any option is selected, if selected it prints the index of the selected option, if not slected then shows an error
    if (selectedOptionIndex != null) {
      // if the option is selected, then displays the index to the coonsole
      print('Selected option index: $selectedOptionIndex');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QuizPage2()),
      );
    } else {
      // Show error
      showDialog(
        // this shows a error dialog to the user
        context:
            context, // provides the coontext in which the dialog shouyld be displayed
        builder: (BuildContext context) {
          // builder function that returns the AlertDialog widget
          return AlertDialog(
            //displays a model dialog
            title: const Text('Error'),
            content:
                const Text('Please select an option to submit the answer.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pop(); //closes the dialog when the button is pressed
                },
                child: const Text('OK'), // sets the text of button to OK
              )
            ],
          );
        },
      );
    }
  }

  Widget buildOption(int index, String option) {
    //this builds a widget for each quiz question allowing the user to sleect one
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0), //adds the vertical apdding arund the option widget
      child: InkWell(
        //makes the option widget tappable
        onTap: () {
          selectOption(
              index); //when tapped, calls the selectOption method with the index
        },
        child: Container(
          //holds the visual representation of the option
          padding: const EdgeInsets.all(16), //adds padding inside the container
          decoration: BoxDecoration(
            //decoration of the container
            border: Border.all(
              //adds border around the container
              color: selectedOptionIndex ==
                      index //changes the color of the border to blue if selected otherwise it is light grey
                  ? Colors.blue
                  : Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(8), //rounding the corners
          ),
          child: Text(
            //displays the option text
            option,
            style: TextStyle(
              fontSize: 18,
              color: selectedOptionIndex == index ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //provides basic structure of the interface
      appBar: AppBar(
        //top of the screen
        title: const Text('Quiz Question 1:'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), //sets the padding to 16 p on all sides
        child: Column(
          //arranges the widgets vertically
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //strches the childrn to fill the horizontal space
          children: [
            const Text(
              'What is the capital of France?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
                height: 20), //spacing between the question and the options
            buildOption(0,
                'London'), //calls the buildoption method with the index and the option as the text
            buildOption(1, 'Paris'),
            buildOption(2, 'Berlin'),
            buildOption(3, 'Rome'),
            const SizedBox(
                height:
                    20), //spacing between the options and the button to submit
            ElevatedButton(
              //button for submitting the answers
              onPressed: submitAnswer, //submitanswer method is called
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
