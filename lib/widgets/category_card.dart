import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categories,
    required this.index,
    required this.imageList,
  });

  final List categories;
  final int index;
  final List imageList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Category image
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 250, 249, 249),
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageList[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        //Category name
        Text(
          categories[index],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
