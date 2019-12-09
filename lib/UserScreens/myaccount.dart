import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=================App Bar=================================
      appBar: AppBar(
        title: Text('My Account'),
        //centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.red[300],
      ),
      //=================Body====================================
      body: Center(
        child: Text(
          'My Account Page',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
