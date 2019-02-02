import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../widgets/TodoList.dart';
import '../widgets/InputBox.dart';

class HomePage extends StatefulWidget {

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  bool addTodo = false;
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        setState(() {
          addTodo = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text('我的一天', style: TextStyle(color: Colors.white, fontSize: 16.0)),
            Text('1月30日星期三',
                style: TextStyle(color: Colors.white, fontSize: 12.0)),
          ],
        ),
      ),
      floatingActionButton: addTodo ? null : FloatingActionButton(
        onPressed: () {
          setState(() {
            addTodo = true;
          });
        },
        child: Icon(Icons.add),
      ),
      body: GestureDetector(
        onTap: () {
          focusNode.unfocus();
        },
        child: addTodo ? Stack(
          children: <Widget>[
            TodoList(),
            Positioned(
              child: InputBox(focusNode),
              bottom: 0,
              left: 0,
              right: 0,
            ),
          ],
        ): TodoList(),
      ),
    );
  }
}
