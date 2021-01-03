import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shopping_cart/model.dart';
import 'package:flutter_app/shopping_cart/services.dart';
import 'package:flutter_app/shopping_cart/widgets.dart';
import 'package:http/http.dart' as http;

class ShoppingCartScreen extends StatefulWidget {

  @override
  _ShoppingCartScreenState createState()=>_ShoppingCartScreenState();

}

class _ShoppingCartScreenState extends State<ShoppingCartScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'),
        ),
        body: FutureBuilder<List<ShoppingItem>>(
          future: fetchShoppingList(http.Client()),
          builder: (context, snapshot){
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? ShoppingCart(shoppingList: snapshot.data)
                : Center(child: CircularProgressIndicator());
          }
        )
    );
  }
  
}
