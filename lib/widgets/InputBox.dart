import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  FocusNode focusNode;

  InputBox(this.focusNode);

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
        decoration: InputDecoration(
          hintText: '添加任务',
          border: InputBorder.none,
          prefixIcon: IconButton(icon: const Icon(Icons.radio_button_unchecked), onPressed: () {}),
          suffixIcon: IconButton(icon: const Icon(Icons.send), onPressed: () {}),
        ),
      ),
    );
  }
}
