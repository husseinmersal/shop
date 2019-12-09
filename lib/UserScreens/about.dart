import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=================App Bar=================================
      appBar: AppBar(
        title: Text('About Us'),
        //centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.red[300],
      ),
      //=================Body====================================
      body: Center(
        child: Text(
          'About Page',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
