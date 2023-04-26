import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kavachz_test/components/product_page_shimmer.dart';
import 'package:kavachz_test/controller/product_controller.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key, required this.category});

  final String category;

  final ProductController productController = ProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 250, 249, 249),
        title: Text(
          category.toUpperCase(),
          style: GoogleFonts.sansita(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future:
              productController.fetchProductsfromCategory(category: category),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: ProductPageShimmer(),
              );
            }

            // Carousel for showing products
            return CarouselSlider(
                items: snapshot.data!.map(
                  (product) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),

                        //Product image
                        Expanded(
                          child: Container(
                            width: 250,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 0,
                                      color: Color.fromARGB(255, 182, 182, 182),
                                      offset: Offset(5, 5))
                                ],
                                borderRadius: BorderRadius.circular(12),
                                // color: const Color.fromARGB(255, 250, 249, 249),
                                color: Colors.white,
                                image: DecorationImage(
                                  scale: 4,
                                  image: NetworkImage(product.image),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        // Product title
                        Text(
                          product.title,
                          style: GoogleFonts.sansita(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        //Product price
                        Text(
                          "\$${product.price.toString()}",
                          style: GoogleFonts.sansita(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        //Product rating
                        Text(
                          "Rating - ${product.rating.rate}/5".toString(),
                          style: GoogleFonts.sansita(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        )
                      ],
                    );
                  },
                ).toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: 500,
                    animateToClosest: false,
                    viewportFraction: 0.85,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true));
          },
        ),
      ),
    );
  }
}
