import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeeklyMenuScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weekly Menu"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Expanded(child: Card(child: Text("Arugula Salad"))),
              const Expanded(child: Card(child: Text("Meat Balls")))
            ]
          ),
          Row(
            children: <Widget>[
              const Expanded(child:Card(child: Text("Mushroom Soup"))),
              const Expanded(child:Card(child: Text("Pasta"))),
              const Expanded(child:Card(child: Text("Chicken Cutlets"))),
            ],
          )
        ],
      ));
  }
}