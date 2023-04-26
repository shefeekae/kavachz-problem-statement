import 'package:flutter/material.dart';
import 'package:kavachz_test/components/home_shimmer.dart';
import 'package:kavachz_test/controller/category_controller.dart';
import 'package:kavachz_test/widgets/category_card.dart';
import 'package:kavachz_test/widgets/stats_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //List of category images
  final List<String> imageList = [
    "assets/modern-stationary-collection-arrangement-2.jpg",
    "assets/selective-focus-closeup-diamond-rings-2.jpg",
    "assets/portrait-handsome-stylish-hipster-lambersexual-model-2.jpg",
    "assets/young-woman-beautiful-dress-hat-2.jpg"
  ];

  final CategoryController categoryController = CategoryController();

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          // Cart icon
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

        //Shop name
        title: const Text(
          "SHOP NAME",
          style: TextStyle(color: Colors.green, fontSize: 26),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: shortestSide < 600
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * .6,
                  child: FutureBuilder(
                    future: categoryController.fetchCategories(),
                    builder: (context, snapshot) {
                      //Loading indicator
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const HomePageShimmer();
                      }

                      //Category Grid view
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            childAspectRatio: 1,
                            crossAxisCount:
                                orientation == Orientation.portrait ? 2 : 3),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          //Category card
                          return GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/product',
                                arguments: snapshot.data![index]),
                            child: CategoryCard(
                                imageList: imageList,
                                categories: snapshot.data!,
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
      ),
    );
  }
}
