import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shopping_cart/model.dart';

class ShoppingCart extends StatefulWidget
{
  final List<ShoppingItem> shoppingList;

  const ShoppingCart({Key key, this.shoppingList}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart>{
  List<bool> state;

  @override
  void initState() {
    super.initState();
    state = new List<bool>.generate(widget.shoppingList.length, (bool)=>false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.shoppingList.length,
        itemBuilder: (context, index) {
          return  CheckboxListTile(
              title: Text(widget.shoppingList[index].ingredient.name),
              value: state[index],
              onChanged: (value) {
                setState(() {
                  state[index] = !state[index];
                });}
          );
        });
  }
}