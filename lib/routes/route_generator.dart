import 'package:flutter/material.dart';
import 'package:kavachz_test/view/bottom_nav.dart';
import 'package:kavachz_test/view/product_page.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {

      //Initial Route
      case '/':
        return MaterialPageRoute(
          builder: (context) => const BottomNav(),
        );
      //Product page route
      case '/product':
        if (args is String) {
          return PageTransition(
            child: ProductPage(category: args),
            type: PageTransitionType.scale,
            duration: const Duration(milliseconds: 200),
            reverseDuration: const Duration(milliseconds: 200),
            alignment: Alignment.center,
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(
            child: Text('There is some error in the routing'),
          ),
        );
      },
    );
  }
}
