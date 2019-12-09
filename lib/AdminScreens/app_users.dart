import 'package:flutter/material.dart';

class AppUsers extends StatefulWidget {
  @override
  _AppUsersState createState() => _AppUsersState();
}

class _AppUsersState extends State<AppUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red[300],
        title: new Text("App Users"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          "App Users",
          style: new TextStyle(fontSize: 25.0),
        ),
      ),

    );
  }
}
