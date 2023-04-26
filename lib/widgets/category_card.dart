import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              height: 400,
              width: 400,
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
          style: GoogleFonts.sansita(
            fontSize: 18,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
