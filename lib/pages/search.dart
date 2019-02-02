import 'package:flutter/material.dart';
import '../widgets/SearchNotFound.dart';

class SearchPage {

  static final _delegate = MySearchDelegate();

  static showSearchPage(context) {
    showSearch(context: context, delegate: SearchPage._delegate);
  }
}


class MySearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isNotEmpty ? IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      ) : IconButton(
        tooltip: 'Voice',
        icon: Icon(Icons.mic),
        onPressed: () {},
      ),
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
    return Text('suggestions');
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isNotEmpty ? SearchNotFound() : null;
  }
}
