import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../model/appState.dart';
import '../viewModel/todoList.dart';
import '../model/todo.dart';
import '../redux/actions.dart';
import '../widgets/SearchNotFound.dart';
import '../widgets/TodoList.dart';

class SearchPage {

  static final _delegate = MySearchDelegate();

  static showSearchPage(context) {
    showSearch(context: context, delegate: SearchPage._delegate);
  }
}


class MySearchDelegate extends SearchDelegate<String> {

  Widget _buildInitPlaceholder() {
    return Align(
      alignment: Alignment.center,
      child: Text('输入todo内容，可以搜索🔍哦==', style: TextStyle(fontSize: 18.0)),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isNotEmpty ? IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      ) : Container(height: 0, width: 0),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      tooltip: 'Back',
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildInitPlaceholder();
  }

  @override
  Widget buildResults(BuildContext context) {
    return StoreConnector<AppState, TodoListViewModel>(
      converter: (store) {
        return TodoListViewModel(
          todoList: store.state.todoList,
          removeTodo: (String id) {
            store.dispatch(removeTodo(id));
          },
          toggleFinished: (String id) {
            store.dispatch(changeFinished(id));
          },
          toggleImportance: (String id) {
            store.dispatch(changeImportance(id));
          }
        );
      },
      builder: (context, vm) {
        if (query.isEmpty) {
          return _buildInitPlaceholder();
        }
        List<Todo> data = vm.todoList.where((todo) => todo.title.indexOf(query) > -1).toList();
        return data.length > 0 ? TodoList(
          data: data,
          toggleImportance: vm.toggleImportance,
          toggleFinished: vm.toggleFinished,
          delete: vm.removeTodo,
        ) : SearchNotFound();
      },
    );
  }
}
