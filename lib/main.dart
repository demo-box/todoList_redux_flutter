import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux/reducers.dart';
import 'model/appState.dart';
import 'pages/home.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
  );
  return runApp(App(store));
}

class App extends StatelessWidget {
  Store<AppState> store;

  App(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: ThemeData.light(),
        home: HomePage(),
      ),
    );
  }

}

