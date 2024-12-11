import 'package:flutter/material.dart';
import '../presentation/page/home.dart';
import 'route/route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent)),
      initialRoute: '/',
      onGenerateRoute: AppRouter().generateRoute,
      home: const Home(),
    );
  }
}
