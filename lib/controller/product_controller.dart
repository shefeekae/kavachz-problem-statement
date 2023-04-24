import 'package:kavachz_test/services/product_api.dart';

class ProductController {
  ProductApi api = ProductApi();

  fetchProductsfromCategory({required String category}) async {
    final products = await api.getProductFromCategory(category: category);

    return products;
  }
}
