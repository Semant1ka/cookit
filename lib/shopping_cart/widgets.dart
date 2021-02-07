import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shopping_cart/model.dart';

class ShoppingCart extends StatefulWidget {
  final List<ShoppingItem> shoppingList;

  const ShoppingCart({Key key, this.shoppingList}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  Map<String, List<bool>> state;
  List<String> categories;

  @override
  void initState() {
    super.initState();
    categories = new List<String>();
    // collect all existing categories
    for (var item in widget.shoppingList) {
      if (!categories.contains(item.ingredient.category)) {
        categories.add(item.ingredient.category);
      }
    }

    // generate local state for each category
    state = Map.fromIterable(categories,
        key: (e) => e,
        value: (e) => List<bool>.generate(
            widget.shoppingList
                .where((element) => element.ingredient.category == e)
                .length,
            (index) => false));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Column(children: [
            Container(
                alignment: Alignment.topLeft,
                child: Text(categories[index],
                    style: Theme.of(context).textTheme.headline4)),
            DataTable(
                headingTextStyle: Theme.of(context).textTheme.headline6,
                columns: [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Amount')),
                  DataColumn(label: Text('Measure')),
                ],
                rows: List<DataRow>.generate(
                    widget.shoppingList
                        .where((element) =>
                            element.ingredient.category == categories[index])
                        .length,
                    (i) => DataRow(
                            cells: [
                              DataCell(Text(widget.shoppingList
                                  .where((element) =>
                                      element.ingredient.category ==
                                      categories[index])
                                  .elementAt(i)
                                  .ingredient
                                  .name)),
                              DataCell(Text(widget.shoppingList
                                  .where((element) =>
                                      element.ingredient.category ==
                                      categories[index])
                                  .elementAt(i)
                                  .amount
                                  .toString())),
                              DataCell(Text(widget.shoppingList
                                  .where((element) =>
                                      element.ingredient.category ==
                                      categories[index])
                                  .elementAt(i)
                                  .ingredient
                                  .measure))
                            ],
                            selected: state[categories[index]][i],
                            onSelectChanged: (bool value) {
                              setState(() {
                                state[categories[index]][i] = value;
                              });
                            })))
          ]);
        });
  }
}
