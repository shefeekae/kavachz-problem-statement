import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kavachz_test/components/product_page_shimmer.dart';
import 'package:kavachz_test/controller/product_controller.dart';
import 'package:kavachz_test/model/products.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key, required this.category});

  final String category;

  List<Product> products = [];

  ProductController productController = ProductController();

  getProducts() async {
    products =
        await productController.fetchProductsfromCategory(category: category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 250, 249, 249),
        title: Text(
          category.toUpperCase(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: ProductPageShimmer(),
              );
            }
            return CarouselSlider(
                items: products.map(
                  (product) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(product.image),
                                    fit: BoxFit.contain)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          product.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "\$${product.price.toString()}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Rating - ${product.rating.rate}".toString(),
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    );
                  },
                ).toList(),
                options: CarouselOptions(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: 400,
                    animateToClosest: false,
                    viewportFraction: 0.7,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true));
          },
        ),
      ),
    );
  }
}
