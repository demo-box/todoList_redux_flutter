import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
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
