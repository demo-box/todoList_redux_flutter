import '../model/todo.dart';

class TodoListViewModel {
  final List<Todo> todoList;
  final Function addTodo;
  final Function removeTodo;
  final Function toggleFinished;
  final Function toggleImportance;

  TodoListViewModel({
    this.todoList,
    this.addTodo,
    this.removeTodo,
    this.toggleFinished,
    this.toggleImportance,
  });
}