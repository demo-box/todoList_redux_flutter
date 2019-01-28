import 'types.dart';
import '../model/appState.dart';

AppState appReducer(AppState state, action) {
  final types = action['types'];
  final payload = action['payload'];

  switch (types) {
    case Types.ADD_TODO:
      state.todoList.add(payload);
      return state.copyWith();
    case Types.REMOVE_TODO:
      state.todoList.removeAt(payload);
      return state.copyWith();
    case Types.CHANGE_TODO_TITLE:
      state.todoList[payload['id']].title = payload['title'];
      return state.copyWith();
    case Types.CHANGE_TODO_FINISHED:
      state.todoList[payload['id']].title = payload['finished'];
      return state.copyWith();
  }
  return state;
}