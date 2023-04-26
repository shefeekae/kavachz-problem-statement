import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoryApi {
  final http.Client client;

  CategoryApi(this.client);

  // Method for fetching categories.
  //NOTE : This method only fetches the name of the category and not the images.
  Future<List> getAllCategories() async {
    final uri = Uri.parse("https://fakestoreapi.com/products/categories");

    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final List catogories = jsonDecode(response.body);

      return catogories;
    }
    throw Exception('Some Error Occured');
  }
}
