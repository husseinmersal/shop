import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shop/AdminScreens/admin_home.dart';
import 'package:shop/Tools/app_data.dart';
import 'package:shop/Tools/app_methods.dart';
import 'package:shop/Tools/app_tools.dart';
import 'package:shop/Tools/firebase_methods.dart';

//my imports
import 'package:shop/UserScreens/about.dart';
import 'package:shop/UserScreens/cart.dart';
import 'package:shop/UserScreens/favorites.dart';
import 'package:shop/UserScreens/login.dart';
import 'package:shop/UserScreens/messages.dart';
import 'package:shop/UserScreens/notifications.dart';
import 'package:shop/UserScreens/history.dart';
import 'package:shop/UserScreens/deliveryaddress.dart';
import 'package:shop/UserScreens/myaccount.dart';
import 'package:shop/Tools/products.dart';
import 'package:shop/Tools/categories.dart';

class myhomepage extends StatefulWidget {
  @override
  _myhomepageState createState() => _myhomepageState();
}

class _myhomepageState extends State<myhomepage> {
  BuildContext context;
  String accountName = "";
  String accountEmail = "";
  String accountPhotoURL = "";
  bool isLogedIn;
  AppMethods appMethods = FirebaseMethods();

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  Future getCurrentUser() async {
    accountName = await getStringDataLocally(key: acctfullName);
    accountEmail = await getStringDataLocally(key: userEmail);
    accountPhotoURL = await getStringDataLocally(key: photoURL);
    isLogedIn = await getBoolDataLocally(key: logedIN);

    accountName == null ? accountName = "Guest User" : accountName;
    accountEmail == null ? accountEmail = "guestUser@email.com" : accountEmail;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/m1.jpeg'),
          AssetImage('assets/images/w1.jpeg'),
          AssetImage('assets/images/w3.jpeg'),
          AssetImage('assets/images/c1.jpg'),
          AssetImage('assets/images/w4.jpeg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 1800),
        dotSize: 4.0,
        //dotColor: Colors.grey[400],
        indicatorBgPadding: 4.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      //=================App Bar=================================
      appBar: AppBar(
        title: GestureDetector(
            onLongPress: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AdminHome()));
            },
            child: Text('Wear Shop')),
        //centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.red[300],
        actions: <Widget>[
          //===================search=============
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          //===================favorite===========
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Favorites(),
              ),
            ),
          ),
          //===================messages===========
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Messages(),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 10.0,
                backgroundColor: Colors.red,
                child: Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              )
            ],
          )
        ],
      ),
      //=================Body====================================
      body: Column(
        children: <Widget>[
          //==================slider section=======================
          image_carousel,
          //==================categories section=======================
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
                alignment: Alignment.centerLeft, child: Text("Categories")),
          ),
          //Categories Horizontal List View
          Categories(),
          //==================products section=======================
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text("Recent Products")),
          ),
          //to make size of product flexible from device to another
          Flexible(child: Products()),
        ],
      ),
      //=================floatingActionButton====================
      floatingActionButton: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.red[300],
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cart(),
              ),
            ),
            child: Icon(Icons.shopping_cart),
          ),
          CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.red,
            child: Text(
              '0',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          )
        ],
      ),
      // =========start of drawer section========================
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //header
            UserAccountsDrawerHeader(
              accountName: Text(accountName),
              accountEmail: Text(accountEmail),
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
            //body
            //===================builder for homepage=============
            Builder(
              builder: (context) => Container(
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => myhomepage(),
                    ),
                  ),
                  child: ListTile(
                    title: Text("Home Page"),
                    leading: Icon(
                      Icons.home,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
            //===================my account=======================
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyAccount(),
                ),
              ),
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
            ),
            //===================order notification===============
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Notifications(),
                ),
              ),
              child: ListTile(
                title: Text("Order Notifications"),
                leading: Icon(
                  Icons.notifications,
                  color: Colors.red,
                ),
              ),
            ),
            //===================favourites=======================
            /* InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Favourites"),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),*/
            //========================order history===============
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => History(),
                ),
              ),
              child: ListTile(
                title: Text("Order History"),
                leading: Icon(
                  Icons.history,
                  color: Colors.red,
                ),
              ),
            ),
            //========================delivery address============
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeliveryAddress(),
                ),
              ),
              child: ListTile(
                title: Text("Delivery Address"),
                leading: Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
              ),
            ),
            //===================divider==========================
            Divider(),
            //===================about============================
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => About(),
                ),
              ),
              child: ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.help,
                  color: Colors.blue,
                ),
              ),
            ),
            //===================login============================
            ListTile(
              trailing: new CircleAvatar(
                child: new Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text(isLogedIn == true ? "Logout" : "Login"),
              onTap: () async {
                if (isLogedIn == false) {
                  bool response = await Navigator.of(context).push(
                      new CupertinoPageRoute(
                          builder: (BuildContext context) => new Login()));
                  if (response == true) getCurrentUser();
                  return;
                }
                bool response = await appMethods.logOutUser();
                if (response == true) getCurrentUser();
              },
            ),
          ],
        ),
      ),
    );
  }

 /* checkIfLoggedIn() async {
    if (isLogedIn == false) {
      bool response = await Navigator.of(context).push(new CupertinoPageRoute(
          builder: (BuildContext context) => new Login()));
      if (response == true) getCurrentUser();
      return;
    }
    bool response = await appMethods.logOutUser();
    if (response == true) getCurrentUser();
  }*/


  /*void openAdmin() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => AdminHome()));
  }*/
}
