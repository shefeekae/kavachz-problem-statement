import 'package:flutter/material.dart';
import 'package:kavachz_test/view/home.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Transaction"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined), label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: "Profile")
        ],
        currentIndex: 0,
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
      body: IndexedStack(
        index: 0,
        children: [HomeScreen()],
      ),
    );
  }
}
