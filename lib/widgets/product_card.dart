import 'package:flutter/material.dart';
import 'package:kavachz_test/model/products.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.products});

  final Product products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  products.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Text(
          products.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
