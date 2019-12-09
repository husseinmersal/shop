import 'package:flutter/material.dart';
import 'package:shop/UserScreens/myhomepage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wear Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: myhomepage(),
    );
  }
}

