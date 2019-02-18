import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../model/todo.dart';

class InputBox extends StatelessWidget {
  FocusNode focusNode;
  Function onOk;
  String title;
  int cateIdx;

  InputBox({ this.focusNode, this.onOk, this.cateIdx });

  onSubmit(String title) {
    focusNode.unfocus();
    var todo;
    final uid = Uuid().v1();
    switch (cateIdx) {
      case 1:
        todo = Todo(id: uid, title: title, finished: true, importance: false);
        break;
      case 3:
        todo = Todo(id: uid, title: title, finished: false, importance: true);
        break;
      default:
        todo = Todo(id: uid, title: title, finished: false, importance: false);
    }
    onOk(todo);
  }

  onChange(String title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 0.1,
            spreadRadius: 0.1,
          ),
        ],
      ),
      child: TextField(
        focusNode: focusNode,
        autofocus: true,
        onSubmitted: onSubmit,
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: '添加任务',
          border: InputBorder.none,
          prefixIcon: IconButton(icon: const Icon(Icons.radio_button_unchecked), onPressed: () {}),
          suffixIcon: IconButton(icon: const Icon(Icons.send), onPressed: () {
            print('title:${this.title}');
            onSubmit(title);
          }),
        ),
      ),
    );
  }
}
