import 'package:flutter/material.dart';

class AppMessages extends StatefulWidget {
  @override
  _AppMessagesState createState() => _AppMessagesState();
}

class _AppMessagesState extends State<AppMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red[300],
        title: new Text("App Messages"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text(
          "App Messages",
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );

  }
}
