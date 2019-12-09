import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=================App Bar=================================
      appBar: AppBar(
        title: Text('Order Notifications'),
        //centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.red[300],
      ),
      //=================Body====================================
      body: Center(
        child: Text(
          'My Notifications Page',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
