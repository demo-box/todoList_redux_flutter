import 'types.dart';
import '../model/todo.dart';
import '../model/appState.dart';

AppState appReducer(AppState state, action) {
  final type = action['type'];
  final payload = action['payload'];

  switch (type) {
    case Types.ADD_TODO:
      state.todoList.add(payload);
      return state.copyWith();
    case Types.REMOVE_TODO:
      List<Todo> todoList = state.todoList;
      for (int i = 0; i < todoList.length; i++) {
        if (todoList[i].id == payload) {
          todoList.removeAt(i);
          break;
        }
      }
      return state.copyWith();
    case Types.CHANGE_TODO_FINISHED:
      List<Todo> todoList = state.todoList;
      for (int i = 0; i < todoList.length; i++) {
        if (todoList[i].id == payload) {
          todoList[i].finished = !todoList[i].finished;
          break;
        }
      }
      return state.copyWith();
  }
  return state;
}