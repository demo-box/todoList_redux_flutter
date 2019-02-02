import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  String title = '';
  TodoItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.radio_button_unchecked), onPressed: null),
            Text(title),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.star_border), onPressed: null),
                ],
              ),
            )
          ],
        ),
        Divider(height: 1.0, color: Colors.grey),
      ],
    );
  }
}

