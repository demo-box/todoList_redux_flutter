import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../pages/search.dart';
import '../model/appState.dart';
import '../redux/actions.dart';


class MyDrawer extends StatefulWidget {
  @override
  MyDrawerState createState() {
    return new MyDrawerState();
  }
}

class MyDrawerState extends State<MyDrawer> {
  final List cates = [
    {
      'title': '所有',
      'icon': Icons.wb_sunny,
    },
    {
      'title': '完成',
      'icon': Icons.closed_caption,
    },
    {
      'title': '未完成',
      'icon': Icons.unarchive,
    },
    {
      'title': '重要',
      'icon': Icons.star_border,
    },
  ];

  Widget _buildDrawerBody(DrawerViewModel vm) {
    List<Widget> body = [];
    for (var i = 0; i < cates.length; i++) {
      body.add(DecoratedBox(
        decoration: BoxDecoration(color: vm.selectedIdx == i ? Colors.grey[200]: Colors.white),
        child: InkWell(
          onTap: () {
            vm.changeCateIdx(i);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Icon(cates[i]['icon'], color: Colors.blueAccent),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(cates[i]['title']),
                ),
              ],
            ),
          ),
        ),
      ));
    }
    return Column(
      children: body,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: StoreConnector<AppState, DrawerViewModel>(
          converter: (store) => DrawerViewModel(
            selectedIdx: store.state.cateIdx,
            changeCateIdx: (int idx) {
              store.dispatch(changeCateIdx(idx));
            },
          ),
          builder: (context, vm) => ListView(
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                              'https://avatar-static.segmentfault.com/194/095/1940951021-580ed1e6de49e_huge256'),
                        ),
                        IconButton(icon: Icon(Icons.search), onPressed: () {
                          SearchPage.showSearchPage(context);
                        })
                      ],
                    ),
                    SizedBox(height: 50.0),
                    Text('beilunyang'),
                    Text('786220806@qq.com', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              _buildDrawerBody(vm),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerViewModel {
  int selectedIdx;
  Function changeCateIdx;

  DrawerViewModel({
    this.selectedIdx,
    this.changeCateIdx,
  });
}

