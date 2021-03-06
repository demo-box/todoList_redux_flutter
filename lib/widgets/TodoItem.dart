import 'package:flutter/material.dart';
import '../model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo data;
  final Function toggleFinished;
  final Function toggleImportance;

  TodoItem({
    this.data,
    this.toggleFinished,
    this.toggleImportance,
  });

  @override
  Widget build(BuildContext context) {
    final bool finished = data.finished;
    final bool importance = data.importance;
    return Opacity(
      opacity: finished ? 0.5 : 1,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      finished ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                      color: Colors.grey
                    ),
                    onPressed: () {
                      toggleFinished(data.id);
                    } ,
                  ),
                  Text(data.title),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(icon: Icon(importance ? Icons.star : Icons.star_border), onPressed: () {
                          toggleImportance(data.id);
                        }),
                      ],
                    ),
                  )
                ],
              ),
              finished ? Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: Divider(height: 1.0, color: Colors.grey),
                ),
              ) : Container(height: 0, width: 0),
            ]
          ),
          Divider(height: 1.0, color: Colors.grey),
        ],
      ),
    );
  }
}
