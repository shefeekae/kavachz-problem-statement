import 'package:http/http.dart' as http;
import 'package:kavachz_test/model/products.dart';

class ProductApi {
  Future<List<Product>> getProductFromCategory(
      {required String category}) async {
    final uri =
        Uri.parse("https://fakestoreapi.com/products/category/$category");

    final response = await http.get(uri);

    final products = productFromJson(response.body);

    return products;
  }
}
