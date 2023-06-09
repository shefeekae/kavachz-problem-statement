import 'package:http/http.dart';
import 'package:kavachz_test/services/category_api.dart';

class CategoryController {
  CategoryApi api = CategoryApi(Client());

  Future<List> fetchCategories() async {
    final List productList = await api.getAllCategories();

    return productList;
  }
}
