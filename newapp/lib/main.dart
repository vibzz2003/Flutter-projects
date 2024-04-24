import 'package:flutter/material.dart';


void main(){ //main function which is the main entry point of dart app up to down
// it gives command to runApp to run the application
//the purpose of runapp is to attach a widget to the screen
  runApp(const MyApp()); //it cannot be empty it needs an argument - it needs an input value to run correctly
}

//widget is used to create UI in flutter framework

//STATELESS WIDGET - do not maintain state of the widget 

//myapp extends stateless widget and overrides its build method

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key); //calls the constructor of superclass - stateless widget and passes key as a parameter

  //This widget is the root of my application
  @override
  Widget build(BuildContext context){
    return MaterialApp( //widget that provides common app-related features such as navigation, theme, and title
      //title of application
      title: 'Hello new application', //appears in the os task switcher (title)
      //theme of the application
      theme: ThemeData( //themedata allows us to customise our app
        primarySwatch: Colors.lightGreen, //primaryswatch specifies a colour which is the primary color of the app
      ),
      //inner ui of the application
      home: const MyHomePage(title: 'Home Page'), //main content of the application, basically what the user firstly sees, widget of type WIDGET
      //this creates an instance of the widget MyHomePage and const is there to ensure it is created only once
    );
  }
}

//this class is similar to MyApp instead it returns a scaffold widget
//scaffold is used to create basic visual layout structure of material design and it provides api for drawers and bottom sheets - core widget componnet
//**USED UNDER MATERIALAPP, a predefined class that tells flutter to use material componnents and follow material design  */
class MyHomePage extends StatelessWidget{
  const MyHomePage({Key?key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      //sets the content to the centre of the application page
      body: const Center(child: Text("Welcome to my new app"),),
    );
  }
}
