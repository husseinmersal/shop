import 'package:flutter/material.dart';

class AppProducts extends StatefulWidget {
  @override
  _AppProductsState createState() => _AppProductsState();
}

class _AppProductsState extends State<AppProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red[300],
        title: new Text("App Products"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          "App Products",
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
