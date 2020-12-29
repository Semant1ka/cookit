import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appTitle = "CookIt";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: _appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
        children: <Widget>[
          Center(
            child: Text("Menu for today"),
          ),
          Card(
            child: ListTile(title: Text("Meat balls")),
        ),
          Card(
            child: ListTile(title: Text("Arugula salad")),
          )
        ],
      ),),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Menu"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined),
              title: Text("Week"),
              onTap: () {Navigator.pop(context);},
            ),
            ListTile(
              leading: Icon(Icons.my_library_books_rounded),
              title: Text("Recipes"),
              onTap: () {Navigator.pop(context);},
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined),
              title: Text("Shopping Cart"),
              onTap: () {Navigator.pop(context);},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {Navigator.pop(context);},
            )
          ],
        ),
      ),
    );

  }
}
