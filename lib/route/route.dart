import 'package:flutter/material.dart';
import '../presentation/page/home.dart';
import '../presentation/page/pilih_mode.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/pilihMode':
        return MaterialPageRoute(builder: (_) => const PilihMode());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text("Page not found!")),
      ),
    );
  }
}
