import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:kavachz_test/model/products.dart';
import 'package:kavachz_test/services/product_api.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late ProductApi productApi;
  late MockHTTPClient mockHTTPClient;

  setUp(
    () {
      mockHTTPClient = MockHTTPClient();
      productApi = ProductApi(mockHTTPClient);
    },
  );

  group(
    'ProductApi - ',
    () {
      test(
          'given ProductApi class when a function getProductFromCategory is called and status code is 200, then a list of product model should be returned',
          () async {
        //Arrange
        when(
          () => mockHTTPClient.get(
              Uri.parse('https://fakestoreapi.com/products/category/jewelery')),
        ).thenAnswer((invocation) async {
          return Response('''
          [{"id":5,"title":"John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet","price":695,"description":"From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.","category":"jewelery","image":"https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg","rating":{"rate":4.6,"count":400}},{"id":6,"title":"Solid Gold Petite Micropave ","price":168,"description":"Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.","category":"jewelery","image":"https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg","rating":{"rate":3.9,"count":70}}]
          ''', 200);
        });
        //Act
        final products =
            await productApi.getProductFromCategory(category: 'jewelery');
        //Assert
        expect(products, isA<List<Product>>());
      });

      test(
        'given a class ProductApi when a function getProductFromCategory is called and status code is not 200, then an exception should be thrown',
        () async {
          //Arrange
          when(
            () => mockHTTPClient.get(Uri.parse(
                'https://fakestoreapi.com/products/category/jewelery')),
          ).thenAnswer((invocation) async => Response('{}', 500));

          //Act
          final products =
              productApi.getProductFromCategory(category: 'jewelery');

          //Assert

          expect(products, throwsException);
        },
      );
    },
  );
}
