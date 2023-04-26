import 'package:http/http.dart';
import 'package:kavachz_test/model/products.dart';
import 'package:kavachz_test/services/product_api.dart';

class ProductController {
  ProductApi api = ProductApi(Client());

  Future<List<Product>> fetchProductsfromCategory(
      {required String category}) async {
    final List<Product> products =
        await api.getProductFromCategory(category: category);

    return products;
  }
}
