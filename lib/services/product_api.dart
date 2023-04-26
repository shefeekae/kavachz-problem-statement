import 'package:http/http.dart' as http;
import 'package:kavachz_test/model/products.dart';

class ProductApi {
  final http.Client client;

  ProductApi(this.client);

  // method for fetching products from a particular category
  Future<List<Product>> getProductFromCategory(
      {required String category}) async {
    final uri =
        Uri.parse("https://fakestoreapi.com/products/category/$category");

    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final products = productFromJson(response.body);

      return products;
    }
    throw Exception('Some error occured');
  }
}
