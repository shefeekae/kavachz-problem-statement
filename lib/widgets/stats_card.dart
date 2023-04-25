import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 130,
        width: shortestSide > 500 ? 700 : screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 55, 255, 61),
                  Color.fromARGB(255, 35, 169, 39)
                ])),
        child: Column(
          children: [
            //Today's Stats
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Today's Stats",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: shortestSide < 350 ? 12 : 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //Divider
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),

            //Stats
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Total Sales
                  Column(
                    children: [
                      Text(
                        "₹ 20",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: shortestSide < 350 ? 10 : 16,
                            color: Colors.white),
                      ),
                      Text(
                        "Total Sales",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: shortestSide < 350 ? 10 : 16,
                            color: Colors.white),
                      )
                    ],
                  ),

                  //Total Credit
                  Column(
                    children: [
                      Text(
                        "4",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: shortestSide < 350 ? 10 : 16,
                            color: Colors.white),
                      ),
                      Text(
                        "Total Credit",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: shortestSide < 350 ? 10 : 16,
                            color: Colors.white),
                      )
                    ],
                  ),

                  //Amount Credits
                  Column(
                    children: [
                      Text(
                        "₹ 20",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: shortestSide < 350 ? 10 : 16,
                            color: Colors.white),
                      ),
                      Text(
                        "Amount Credits",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: shortestSide < 350 ? 10 : 16,
                            color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
