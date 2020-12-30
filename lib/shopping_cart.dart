import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Card(
              child: Text("Your items"),
            )
          ],
        ),
      ),
    );
  }
}