import '../model/todo.dart';

class AppState {
  int cateIdx;

  List<Todo> todoList;

  AppState({
    this.todoList,
    this.cateIdx,
  });

  AppState copyWith({ todoList, cateIdx }) {
    return AppState(
      todoList: todoList ?? this.todoList,
      cateIdx: cateIdx ?? this.cateIdx,
    );
  }

  static AppState initialState() {
    return AppState(
      todoList: [],
      cateIdx: 0,
    );
  }
}