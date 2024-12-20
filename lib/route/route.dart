import 'package:flutter/material.dart';
import '../presentation/page/jangka_hidup_hewan.dart';
import '../presentation/page/waktu_sejarah.dart';
import '../presentation/page/tinggi_hewan.dart';
import '../presentation/page/home.dart';
import '../presentation/page/pilih_mode.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/pilihMode':
        return MaterialPageRoute(builder: (_) => const PilihMode());
      case '/tinggiHewan':
        return MaterialPageRoute(builder: (_) => const TinggiHewan());
      case '/jangkaHidupHewan':
        return MaterialPageRoute(builder: (_) => const JangkaHidupHewan());
      case '/waktuSejarah':
        return MaterialPageRoute(builder: (_) => const WaktuSejarah());
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
