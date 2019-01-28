import 'package:flutter/foundation.dart';
import 'todoItem.dart';

class AppState {
  List<TodoItem> todoList;

  AppState({
    @required this.todoList
  });

  AppState copyWith({ todoList }) {
    return AppState(
      todoList: todoList ?? this.todoList,
    );
  }

  static AppState initialState() {
    return AppState(
      todoList: [],
    );
  }
}