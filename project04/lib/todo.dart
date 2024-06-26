import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  TodoListPageState createState() => TodoListPageState();
}

class TodoListPageState extends State<TodoListPage> {
  final List<Map<String, dynamic>> todoitems =
      []; //todoitems is a list with each item is a map of task and completion status
  final TextEditingController textcontroller =
      TextEditingController(); //textcontroller is a controller for the text input field to manage the text input

  void addtodoitem(String task) {
    setState(() {
      todoitems.add({'task': task, 'completed': false});
    });
    textcontroller.clear(); //is called to clear the text input field
  }

  void toggletodoitem(int index) {
    setState(() {
      todoitems[index]['completed'] =
          !todoitems[index]['completed']; //toggles the completetion status
    });
  }

  void deletetodoitem(int index) {
    setState(() {
      todoitems.removeAt(index); //removeAt removes the specific index
    });
  }

  void promptaddtodoitem() {
    //shows dialog for the user to add a new task
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('New Task'),
            content: TextField(
              controller: textcontroller,
              autofocus: true,
              onSubmitted: (value) {
                addtodoitem(value);
                Navigator.pop(context);
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                  onPressed: () {
                    addtodoitem(textcontroller.text);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add')),
            ],
          );
        });
  }

  Widget buildtodolist() {
    return ListView.builder(
      itemCount: todoitems.length,
      itemBuilder: (context, index) {
        return buildtodoitem(todoitems[index], index);
      },
    );
  }

  Widget buildtodoitem(Map<String, dynamic> todo, int index) {
    return ListTile(
      title: Text(
        todo['task'],
        style: TextStyle(
          decoration: todo['completed'] ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: IconButton(
          onPressed: () {
            toggletodoitem(index);
          },
          icon: Icon(
            todo['completed'] ? Icons.check_box : Icons.check_box_outline_blank,
          )),
      trailing: IconButton(
          onPressed: () {
            deletetodoitem(index);
          },
          icon: const Icon(Icons.delete)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: buildtodolist(),
      floatingActionButton: FloatingActionButton(
        onPressed: promptaddtodoitem,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
