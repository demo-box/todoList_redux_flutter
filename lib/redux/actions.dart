import 'types.dart';

addTodo(payload) => {
  'type': Types.ADD_TODO,
  'payload': payload,
};

removeTodo(payload) => {
  'type': Types.REMOVE_TODO,
  'payload': payload,
};

changeTitle(payload) => {
  'type': Types.CHANGE_TODO_TITLE,
  'payload': payload,
};

changeFinished(payload) => {
  'type': Types.CHANGE_TODO_FINISHED,
  'payload': payload,
};