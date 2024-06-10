import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/Todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(int index) onRemoveTodo;
  final Function(int index) onToggleTodo;

  TodoList ({
    required this.todos,
    required this.onRemoveTodo,
    required this.onToggleTodo,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        // return ListTile(
        //   title: Text(todos[index].title),
        //   leading: Checkbox(
        //     value: todos[index].isDone,
        //     onChanged: null,
        //   ),
        // );
        return Dismissible(
          key: Key(todos[index].title),
          onDismissed: (direction) => onRemoveTodo(index),
          background: Container(
            color: Colors.red,
            child: Icon(Icons.delete, color: Colors.white),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20.0),
          ),
          child: ListTile(
            title: Text(
                todos[index].title,
                style: todos[index].isDone
                    ? TextStyle(decoration: TextDecoration.lineThrough,decorationColor: Colors.red, color: Colors.grey)
                    : TextStyle(decoration: TextDecoration.none)
            ),
            leading: Checkbox(
              value: todos[index].isDone,
              onChanged: (bool? value) {
                onToggleTodo(index);
              },
            ),
          ),
        );
      },
    );
  }

}