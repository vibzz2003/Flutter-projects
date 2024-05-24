import 'package:flutter/material.dart';
import 'package:project06/model/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
          itemBuilder: (ctx, index) => Text(meals[index].title))
    if(meals.isEmpty){

    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: 
  );}
}
