import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Card(
              child: Text("Arugula Salad"),
            )
          ],
        ),
      ),
    );
  }
}