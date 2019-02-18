import 'types.dart';

addTodo(payload) => {
  'type': Types.ADD_TODO,
  'payload': payload,
};

removeTodo(payload) => {
  'type': Types.REMOVE_TODO,
  'payload': payload,
};

changeFinished(payload) => {
  'type': Types.CHANGE_TODO_FINISHED,
  'payload': payload,
};

changeImportance(payload) => {
  'type': Types.CHANGE_TODO_IMPORTANCE,
  'payload': payload,
};

changeCateIdx(payload) => {
  'type': Types.CHANGE_CATE_IDX,
  'payload': payload,
};
