import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoryApi {
  getAllCategories() async {
    final uri = Uri.parse("https://fakestoreapi.com/products/categories");

    final response = await http.get(uri);

    final List catogories = jsonDecode(response.body);

    return catogories;
  }
}
