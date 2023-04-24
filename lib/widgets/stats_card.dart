import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 130,
        width: screenWidth,
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
              children: const [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Today's Stats",
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
                    children: const [
                      Text(
                        "₹ 20",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "Total Sales",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ],
                  ),

                  //Total Credit
                  Column(
                    children: const [
                      Text(
                        "4",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "Total Credit",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ],
                  ),

                  //Amount Credits
                  Column(
                    children: const [
                      Text(
                        "₹ 20",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "Amount Credits",
                        style: TextStyle(fontSize: 16, color: Colors.white),
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
