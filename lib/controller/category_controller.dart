import 'package:kavachz_test/services/category_api.dart';

class CategoryController {
  CategoryApi api = CategoryApi();

  fetchCategories() async {
    final productList = await api.getAllCategories();

    return productList;
  }
}
