import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class ProductPageShimmer extends StatelessWidget {
  const ProductPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300] as Color,
      highlightColor: Colors.grey[100] as Color,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.white,
              height: 20,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              height: 20,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              height: 20,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
