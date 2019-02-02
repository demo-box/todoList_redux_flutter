import 'package:flutter/material.dart';
import 'TodoItem.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return TodoItem('吃饭啊');
          }),
    );
  }
}