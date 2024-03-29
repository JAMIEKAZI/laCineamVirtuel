import 'package:flutter/material.dart';

class AppBarAction extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  AppBarAction({this.scaffoldKey});

  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          scaffoldKey!.currentState!.openDrawer();
        },
        child: Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: Icon(Icons.menu)));
  }
}
