import 'package:flutter/material.dart';

class AppOrders extends StatefulWidget {
  @override
  _AppOrdersState createState() => _AppOrdersState();
}

class _AppOrdersState extends State<AppOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red[300],
        title: new Text("App Orders"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          "App Orders",
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}

 