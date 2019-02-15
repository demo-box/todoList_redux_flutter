import '../model/todo.dart';

class AppState {
  List<Todo> todoList;

  AppState({
    this.todoList
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