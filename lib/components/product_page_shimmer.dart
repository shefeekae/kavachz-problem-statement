import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductPageShimmer extends StatelessWidget {
  const ProductPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Shimmer.fromColors(
      baseColor: Colors.grey[300] as Color,
      highlightColor: Colors.grey[100] as Color,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: orientation == Orientation.portrait ? 300 : 150,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.white,
              height: 20,
              width: 250,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              height: 20,
              width: 250,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              height: 20,
              width: 250,
            ),
          ],
        ),
      ),
    );
  }
}
