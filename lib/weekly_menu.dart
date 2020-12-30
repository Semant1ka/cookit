import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeeklyMenuScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weekly Menu"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Card(
              child: Text("FooBar"),
            )
          ],
        ),
      ),
    );
  }
}