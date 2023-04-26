import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:kavachz_test/services/category_api.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late CategoryApi categoryApi;
  late MockHTTPClient mockHTTPClient;

  setUp(
    () {
      mockHTTPClient = MockHTTPClient();
      categoryApi = CategoryApi(mockHTTPClient);
    },
  );

  group(
    'CategoryApi - ',
    () {
      test(
        'given CategoryApi class when getAllCategories function is called and status code is 200, then a list of string should be returned',
        () async {
          //Arrange
          when(
            () => mockHTTPClient
                .get(Uri.parse("https://fakestoreapi.com/products/categories")),
          ).thenAnswer((invocation) async {
            return Response('''
             [
            "electronics",
            "jewelery",
            "men's clothing",
            "women's clothing"
            ]
            ''', 200);
          });

          //Act
          final category = await categoryApi.getAllCategories();

          //Assert
          expect(category, isA<List<dynamic>>());
        },
      );
      test(
        'given CategoryApi class when getAllCategories funtion is called and status code is not 200, then an exceptioon should be thrown.',
        () async {
          //Arrange
          when(
            () => mockHTTPClient
                .get(Uri.parse("https://fakestoreapi.com/products/categories")),
          ).thenAnswer((invocation) async => Response('{}', 500));

          //Act
          final category = categoryApi.getAllCategories();

          //Assert
          expect(category, throwsException);
        },
      );
    },
  );
}
