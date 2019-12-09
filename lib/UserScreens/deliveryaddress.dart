import 'package:flutter/material.dart';

class DeliveryAddress extends StatefulWidget {
  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=================App Bar=================================
      appBar: AppBar(
        title: Text('Delivery Address'),
        //centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.red[300],
      ),
      //=================Body====================================
      body: Center(
        child: Text(
          'My Address Page',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
