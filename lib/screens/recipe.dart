import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeTitle extends StatelessWidget {
  // used to be Recipe
  final String recipe;
  final double padding;

  RecipeTitle(this.recipe, this.padding);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        // Default value for crossAxisAlignment is CrossAxisAlignment.center.
        // We want to align title and description of recipes left:
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            recipe,
            //recipe.name,
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }
}

class RecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recipe"),
        ),
        body: Container(
          child: ListView(
            children: [
              Image.asset("assets/images/arugula.jpg"),
              RecipeTitle("Arugula Salad", 15),
              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.kitchen, color: Colors.blue[500]),
                        Text('Prep:'),
                        Text('5 min'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.timer, color: Colors.blue[500]),
                        Text('Cook:'),
                        Text('1 min'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.restaurant, color: Colors.blue[500]),
                        Text('Servings:'),
                        Text('4-6'),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(child: RecipeTitle("Ingredients", 15)),
                  Expanded(child: RecipeTitle("Directions", 15)),
                ],
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Card(child: Text("arugula", style: Theme.of(context).textTheme.bodyText1)),
                          Card(child: Text("cherry tomatoes", style: Theme.of(context).textTheme.bodyText1)),
                          Card(child: Text("pumpkin seeds", style: Theme.of(context).textTheme.bodyText1)),
                          Card(child: Text("olive oil", style: Theme.of(context).textTheme.bodyText1)),
                          Card(child: Text("salt", style: Theme.of(context).textTheme.bodyText1)),
                        ],
                      ),
                    ),
                    VerticalDivider(thickness: 3),
                    Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                child: Text("Step 1: Rinse arugula.", style: Theme.of(context).textTheme.bodyText2),
                              ),
                              Card(
                                child: Text("Step 2: Rinse and cut cherry tomatoes.", style: Theme.of(context).textTheme.bodyText2),
                              ),
                              Card(
                                child: Text("Step 3: Mix tomatoes, arugula, and pumpkin seeds in a salad bowl.", style: Theme.of(context).textTheme.bodyText2),
                              ),
                              Card(
                                child: Text("Step 4: Add salt and olive oil.", style: Theme.of(context).textTheme.bodyText2),
                              )
                           ],
                    ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
