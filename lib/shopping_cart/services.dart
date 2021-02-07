import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/shopping_cart/model.dart';

List<ShoppingItem> parseShoppingItems(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<ShoppingItem>((json) => ShoppingItem.fromJson(json))
      .toList();
}

Future<List<ShoppingItem>> fetchShoppingList(http.Client client) async {
  final response = await client.get(
      "https://5ff3d0cb16cf4f0017c1f6df.mockapi.io/api/v1/shopping_list");

  if (response.statusCode == 200) {
    return parseShoppingItems(response.body);
  } else {
    throw Exception("Failed to load recipes list.");
  }
}
