import 'package:flutter/foundation.dart';

class TodoItem {
  int id;
  String title;
  bool finished;

  TodoItem({
    @required this.id,
    @required this.title,
    @required this.finished,
  });
}
