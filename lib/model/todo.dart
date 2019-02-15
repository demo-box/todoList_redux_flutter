import 'package:flutter/foundation.dart';

class Todo {
  String id;
  String title;
  bool finished;

  Todo({
    @required this.id,
    @required this.title,
    @required this.finished,
  });
}
