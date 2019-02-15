import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../model/todo.dart';

class InputBox extends StatelessWidget {
  FocusNode focusNode;
  Function onOk;
  String title;

  InputBox({ this.focusNode, this.onOk });

  onSubmit(String title) {
    focusNode.unfocus();
    onOk(Todo(id: Uuid().v1(), title: title, finished: false));
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
