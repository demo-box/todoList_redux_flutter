import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../model/appState.dart';
import '../model/todo.dart';
import '../widgets/drawer.dart';
import '../widgets/TodoList.dart';
import '../widgets/InputBox.dart';
import '../redux/actions.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  bool isAddTodo = false;
  FocusNode focusNode;

  String getFormattedDate() {
    List<String> weeks = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('MM月dd日');
    String date = formatter.format(now);
    return date + weeks[now.weekday];
  }

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        setState(() {
          isAddTodo = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageViewModel>(
      converter: (store) {
        return HomePageViewModel(
          todoList: store.state.todoList,
          addTodo: (todo) {
            store.dispatch(addTodo(todo));
          },
          removeTodo: (id) {
            store.dispatch(removeTodo(id));
          },
          toggleFinished: (id) {
            store.dispatch(changeFinished(id));
          },
        );
      },
      builder: (context, vm) {
        return Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            title: Column(
              children: <Widget>[
                Text('我的一天', style: TextStyle(color: Colors.white, fontSize: 16.0)),
                Text(this.getFormattedDate(),
                    style: TextStyle(color: Colors.white, fontSize: 12.0)),
              ],
            ),
          ),
          floatingActionButton: isAddTodo ? null : FloatingActionButton(
            onPressed: () {
              setState(() {
                isAddTodo = true;
              });
            },
            child: Icon(Icons.add),
          ),
          body: GestureDetector(
            onTap: () {
              focusNode.unfocus();
            },
            child: Stack(
              children: <Widget>[
                TodoList(data: vm.todoList, delete: vm.removeTodo, toggleFinished: vm.toggleFinished),
                isAddTodo ? Positioned(
                  child: InputBox(onOk: vm.addTodo, focusNode: focusNode),
                  bottom: 0,
                  left: 0,
                  right: 0,
                ) : Container(height: 0, width: 0),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HomePageViewModel {
  final List<Todo> todoList;
  final Function addTodo;
  final Function removeTodo;
  final Function toggleFinished;

  HomePageViewModel({
    this.todoList,
    this.addTodo,
    this.removeTodo,
    this.toggleFinished,
  });
}
