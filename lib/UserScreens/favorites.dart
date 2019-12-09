import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=================App Bar=================================
      appBar: AppBar(
        title: Text('My Favorites'),
        //centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.red[300],
      ),
      //=================Body====================================
      body: Center(
        child: Text(
          'My Favorites Page',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}

