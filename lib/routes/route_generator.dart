import 'package:flutter/material.dart';
import 'package:kavachz_test/view/bottom_nav.dart';
import 'package:kavachz_test/view/product_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const BottomNav(),
        );

      case '/product':
        if (args is String) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ProductPage(category: args),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // animation = Tween<double>(begin: 0, end: 1
              // final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
              // final offsetAnimation = animation.drive(tween);
              return FadeTransition(
                opacity: animation,
                alwaysIncludeSemantics: false,
                child: child,
              );
            },
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
            child: Text('There is Some error in the routing'),
          ),
        );
      },
    );
  }
}
