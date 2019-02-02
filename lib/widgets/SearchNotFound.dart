import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          'assets/404.svg',
          width: 120.0,
        ),
        SizedBox(height: 10.0),
        Center(
          child: Text('已进行深度搜索，但找不到你当前查找的内容.', style: TextStyle(color: Colors.grey, fontSize: 14.0)),
        ),
      ],
    );
  }
}
