import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  TicTacToeState createState() => TicTacToeState();
}

class TicTacToeState extends State<TicTacToe> {
  bool oTurn = true; //the first chance would be of O

  // 1st player is O
  List<String> displayElement = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ]; //the list declaration with 9 empty strings, representing the initial state of the board
  int oScore = 0; //initial score of O
  int xScore = 0; //initial score of X
  int filledBoxes = 0; //number of filled boxes in the board

  @override //overriding the build method of Stateful Widget
  Widget build(BuildContext context) {
    return Scaffold(
      //widget whoch gives a basic structure for the visual layout of the app, including the app bars, drawers, and snack bars
      backgroundColor: Colors.indigo[900],
      body: Column(
        //specifies the body of scaffold, containing other widgets vertically
        children: <Widget>[
          Expanded(
            //Creates a widget that expands a child of a [Row], [Column], or [Flex] so that the child fills the available space along the flex widget's main axis.
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Player X',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          xScore.toString(),
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Player O',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text(
                          oScore.toString(),
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex:
                4, //this sets the flex factor of expanded to 4, which means that it will occupy 4 times the vertical space of other widgets with a flex factor of 1
            child: GridView.builder(
                //creates a GridView widget using builder pattern, displays the grid of widgets
                itemCount: 9, //total grid no = 9
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //layouts the grid to have fixed number of items per row/column
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          displayElement[index],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 35),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.indigo[50],
                  ),
                  onPressed: _clearScoreBoard,
                  child: const Text("Clear Score Board"),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  void _tapped(int index) {
    //updates the state of the game when it is called
    setState(() {
      if (oTurn && displayElement[index] == '') {
        //if the grid box is empty and o taps it, it displays O there
        displayElement[index] = 'O';
        filledBoxes++; //increases the count of filledboxes with 1
      } else if (!oTurn && displayElement[index] == '') {
        displayElement[index] = 'X';
        filledBoxes++;
      }

      oTurn = !oTurn; //toggles the value of turns
      _checkWinner(); //is called to check the winner after each tap
    });
  }

  void _checkWinner() {
    // Checking rows
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]); //calls the showwindialog
    }
    if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      _showWinDialog(displayElement[3]);
    }
    if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      _showWinDialog(displayElement[6]);
    }

    // Checking Column
    if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      _showWinDialog(displayElement[1]);
    }
    if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    }

    // Checking Diagonal
    if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        //to display a dialog box on screen
        barrierDismissible:
            false, //dialog box cannot be dismissed by tapping outside the box
        context:
            context, //the context is basically passed from the parents build method
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" $winner \" is Winner!!!"),
            actions: [
              TextButton(
                child: const Text("Play Again"),
                onPressed: () {
                  _clearBoard(); //calls out clear board function
                  Navigator.of(context).pop(); //pops the alert box
                },
              ),
            ],
          );
        });

    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Draw"),
            actions: [
              TextButton(
                child: const Text("Play Again"),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });

    filledBoxes = 0;
  }

  void _clearScoreBoard() {
    setState(() {
      xScore = 0;
      oScore = 0;
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });
    filledBoxes = 0;
  }
}
