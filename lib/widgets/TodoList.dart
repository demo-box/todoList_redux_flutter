import 'package:flutter/material.dart';
import '../model/todo.dart';
import 'TodoItem.dart';

class TodoList extends StatelessWidget {
  final List<Todo> data;
  final Function delete;
  final Function toggleFinished;
  final Function toggleImportance;

  TodoList({
    this.data,
    this.delete,
    this.toggleFinished,
    this.toggleImportance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          Todo todo = data[index];

          return Dismissible(
            background: Container(
              color: Colors.red,
              child: Center(
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            key: Key(todo.title),
            child: TodoItem(
              data: data[index],
              toggleFinished: this.toggleFinished,
              toggleImportance: this.toggleImportance,
            ),
            onDismissed: (direction) {
              delete(data[index].id);
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("删除成功"), duration: Duration(milliseconds: 500)));
            },
          );
        }),
    );
  }
}

