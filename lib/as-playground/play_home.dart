import 'package:flutter/material.dart';

class Todo {
  final String title;
  final bool isDone;

  Todo({
    required this.title,
    required this.isDone,
  });
}

class PlayHome extends StatefulWidget {
  const PlayHome({Key? key}) : super(key: key);

  @override
  State<PlayHome> createState() => _PlayHomeState();
}

class _PlayHomeState extends State<PlayHome> {
  List<Todo> todos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo App",
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(todos[index].title),
              onDismissed: (direction) {
                _deleteTodo(index);
              },
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    todos[index].title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: Checkbox(
                    onChanged: (value) {
                      setState(
                        () {
                          todos[index] = Todo(
                            title: todos[index].title,
                            isDone: value ?? false,
                          );
                        },
                      );
                    },
                    value: todos[index].isDone,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  void _addTodo(String title) {
    setState(() {
      todos.add(Todo(title: title, isDone: false));
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTodoTitle = '';
        return AlertDialog(
          title: const Text(
            "Add todo",
          ),
          content: TextField(
            onChanged: (value) {
              newTodoTitle = value;
            },
            decoration: const InputDecoration(
              hintText: "Input here",
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _addTodo(newTodoTitle);
                Navigator.of(context).pop();
                print(todos);
              },
              child: const Text(
                "Add todo",
              ),
            )
          ],
        );
      },
    );
  }
}
