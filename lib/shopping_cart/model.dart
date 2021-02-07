class ShoppingItem {
    Ingredient ingredient;
    int amount;

    ShoppingItem(this.ingredient, this.amount);

    factory ShoppingItem.fromJson(Map<String, dynamic> json){
      Ingredient _ingredient = Ingredient.fromJson(json['ingredient']);
      return ShoppingItem(_ingredient, json['amount'] as int);
    }
}

class Ingredient {
  final String name;
  final String measure;
  final String category;
  final List<String> tags;


  Ingredient(this.name, this.measure, this.tags, this.category);
  
  factory Ingredient.fromJson(Map<String, dynamic> json){
    return Ingredient(
        json['name'] as String,
        json['measure'] as String,
        List<String>.from(json['tags']),
        json['category'] as String
    );
  }
}
