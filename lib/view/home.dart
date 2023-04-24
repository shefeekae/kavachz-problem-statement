import 'package:flutter/material.dart';
import 'package:kavachz_test/components/home_shimmer.dart';
import 'package:kavachz_test/controller/category_controller.dart';
import 'package:kavachz_test/view/product_page.dart';
import 'package:kavachz_test/widgets/category_card.dart';
import 'package:kavachz_test/widgets/stats_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // List<Products> productList = [];
  List categoryList = [];

  final List<String> imageList = [
    "assets/modern-stationary-collection-arrangement.jpg",
    "assets/selective-focus-closeup-diamond-rings.jpg",
    "assets/portrait-handsome-stylish-hipster-lambersexual-model.jpg",
    "assets/young-woman-beautiful-dress-hat.jpg"
  ];

  final CategoryController productsController = CategoryController();

  getAllProducts() async {
    categoryList = await productsController.fetchCategories();
    // categoryList = productList.map((e) => e.category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              splashColor: Colors.grey[200],
              splashRadius: 20,
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
                size: 30,
              ))
        ],
        backgroundColor: const Color.fromARGB(255, 250, 249, 249),
        centerTitle: false,
        title: const Text(
          "SHOP NAME",
          style: TextStyle(color: Colors.green, fontSize: 26),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Stats Card
              const StatsCard(),

              //Categories
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //Category List
              Expanded(
                child: FutureBuilder(
                  future: getAllProducts(),
                  builder: (context, snapshot) {
                    //Loading indicator
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const HomePageShimmer();
                    }

                    //Category Grid view
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              childAspectRatio: 0.9,
                              crossAxisCount: 2),
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        //Category card
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/product',
                              arguments: categoryList[index]),
                          child: CategoryCard(
                              imageList: imageList,
                              categories: categoryList,
                              index: index),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
