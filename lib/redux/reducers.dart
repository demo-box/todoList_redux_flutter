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
      final int idx = state.todoList.indexWhere((todo) => todo.id == payload);
      todoList.removeAt(idx);
      return state.copyWith();
    case Types.CHANGE_TODO_FINISHED:
      List<Todo> todoList = state.todoList;
      final int idx = state.todoList.indexWhere((todo) => todo.id == payload);
      todoList[idx].finished = !todoList[idx].finished;
      return state.copyWith();
    case Types.CHANGE_TODO_IMPORTANCE:
      List<Todo> todoList = state.todoList;
      final int idx = state.todoList.indexWhere((todo) => todo.id == payload);
      todoList[idx].importance = !todoList[idx].importance;
      return state.copyWith();
    case Types.CHANGE_CATE_IDX:
      return state.copyWith(cateIdx: payload);
  }
  return state;
}