import 'package:flutter/material.dart';
import 'package:flutter_app/screens/recipe.dart';
import 'package:flutter_app/screens/recipes.dart';
import 'package:flutter_app/screens/settings.dart';
import 'package:flutter_app/screens/shopping_cart.dart';
import 'package:flutter_app/screens/weekly_menu.dart';


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
      routes: {
        "/recipes": (context)=> RecipesScreen(),
        "/settings" : (context)=> SettingsScreen(),
        "/shopping_cart": (context)=> ShoppingCartScreen(),
        "/weekly_menu" : (context)=> WeeklyMenuScreen(),
      },
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
            child: Text("Menu for today", style: Theme.of(context).textTheme.headline4),
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/meatballs.jpeg'),
                ListTile(title: Text("Meatballs"),
                  onTap: () {
                  print("tap");
                  var dialog = SimpleDialog(
                       title: Text("Meatballs"),
                       children: [SimpleDialogOption(child:Text("My recipe"))]
                   );
                  showDialog(context: context, builder: (BuildContext context) => dialog);
                  },
                ),
              ],
            ),
        ),
          Card(
            child: Column(
              children: [
                Image.asset('assets/images/arugula.jpg'),
                ListTile(title: Text("Arugula salad"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                      builder: (BuildContext context) => RecipeScreen(),
                  fullscreenDialog: true,
                  ));

          }),
              ],
            ),
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
              onTap: () {Navigator.pushNamed(context, "/weekly_menu");},
            ),
            ListTile(
              leading: Icon(Icons.my_library_books_rounded),
              title: Text("Recipes"),
              onTap: () {
                Navigator.pushNamed(context, "/recipes");
                },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined),
              title: Text("Shopping Cart"),
              onTap: () {
                Navigator.pushNamed(context, "/shopping_cart");
                },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pushNamed(context, "/settings");
                },
            )
          ],
        ),
      ),
    );

  }
}
