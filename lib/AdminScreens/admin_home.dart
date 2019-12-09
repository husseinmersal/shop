import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/AdminScreens/add_products.dart';
import 'package:shop/AdminScreens/app_messages.dart';
import 'package:shop/AdminScreens/app_orders.dart';
import 'package:shop/AdminScreens/app_products.dart';
import 'package:shop/AdminScreens/app_users.dart';
import 'package:shop/AdminScreens/order_history.dart';
import 'package:shop/AdminScreens/privilages.dart';
import 'package:shop/AdminScreens/search_data.dart';





class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  Size screenSize;
  @override
  Widget build(BuildContext context) {
    screenSize  = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        title:
        Text('App Admin'),
        centerTitle: true,
        elevation: 2.0,
        backgroundColor: Colors.red[300],
      ),
      endDrawer: Container(
        width: screenSize.width-50,
        color: Colors.white,

        child: Column(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("ShopApp Admin"),
            accountEmail: Text("support@gmail.com"),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(color: Colors.pink),
          ),
        ],),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 20.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => SearchData()));
                  },
                  child: new CircleAvatar(
                    backgroundColor: Colors.black38,
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.search),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text("Search Data"),
                      ],
                    ),
                  ),
                ),
                new GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new CupertinoPageRoute(
                        builder: (context) => AppUsers()));
                  },
                  child: new CircleAvatar(
                    backgroundColor: Colors.black38,
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.person),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text("App Users"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            new SizedBox(
              height: 20.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new CupertinoPageRoute(
                        builder: (context) => AppOrders()));
                  },
                  child: new CircleAvatar(
                    backgroundColor: Colors.black38,
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.notifications),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text("App Orders"),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new CupertinoPageRoute(
                        builder: (context) => AppMessages()));
                  },
                  child: new CircleAvatar(
                    backgroundColor: Colors.black38,
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.chat),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text("App Messages"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            new SizedBox(
              height: 20.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new CupertinoPageRoute(
                        builder: (context) => AppProducts()));
                  },
                  child: new CircleAvatar(
                    backgroundColor: Colors.black38,
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.shop),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text("App Products"),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new CupertinoPageRoute(
                        builder: (context) => AddProducts()));
                  },
                  child: new CircleAvatar(
                    backgroundColor: Colors.black38,
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.add),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text("Add Products"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            new SizedBox(
              height: 20.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new CupertinoPageRoute(
                        builder: (context) => OrderHistory()));
                  },
                  child: new CircleAvatar(
                    backgroundColor: Colors.black38,
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.history),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text("Order History"),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new CupertinoPageRoute(
                        builder: (context) => Privilages()));
                  },
                  child: new CircleAvatar(
                    backgroundColor: Colors.black38,
                    maxRadius: 70.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.person),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text("Privilages"),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

  }
}



















