//This is a shimmer widget for product page.

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePageShimmer extends StatelessWidget {
  const HomePageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Shimmer.fromColors(
      baseColor: Colors.grey[300] as Color,
      highlightColor: Colors.grey[100] as Color,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 0.9,
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
      ),
    );
  }
}
