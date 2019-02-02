import 'package:flutter/material.dart';
import '../pages/search.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
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
                        print("hello");
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
          ],
        ),
      ),
    );
  }
}

