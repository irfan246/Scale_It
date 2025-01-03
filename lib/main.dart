import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scale_it/application/bloc_jangka_hidup_hewan/jangka_hidup_hewan_bloc.dart';
import 'package:scale_it/application/bloc_tinggi_hewan/tinggi_hewan_bloc.dart';
import 'package:scale_it/application/block_waktu_sejarah/waktu_sejarah_bloc.dart';
import 'package:scale_it/infrastructure/jangka_hidup_hewan/highscore_database.dart';
import 'package:scale_it/infrastructure/jangka_hidup_hewan/local_database.dart';
import 'package:scale_it/infrastructure/tinggi_hewan/highscore_database.dart';
import 'package:scale_it/infrastructure/waktu_sejarah/highscore_database.dart';
import 'package:scale_it/infrastructure/waktu_sejarah/local_database.dart';
import '../presentation/page/home.dart';
import 'infrastructure/tinggi_hewan/local_database.dart';
import 'route/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  final tinggiHewanDatabase = TinggiHewanHighScoreDatabase();
  final waktuSejarahDatabase = WaktuSejarahHighScoreDatabase();
  final jangaHidupHewanDatabase = JangkaHidupHewanHighScoreDatabase();
  runApp(App(
    tinggiHewanDatabase: tinggiHewanDatabase,
    waktuSejarahDatabase: waktuSejarahDatabase,
    jangkaHidupHewanDatabase: jangaHidupHewanDatabase,
  ));
}

class App extends StatelessWidget {
  final TinggiHewanHighScoreDatabase tinggiHewanDatabase;
  final WaktuSejarahHighScoreDatabase waktuSejarahDatabase;
  final JangkaHidupHewanHighScoreDatabase jangkaHidupHewanDatabase;

  const App({
    super.key,
    required this.tinggiHewanDatabase,
    required this.waktuSejarahDatabase,
    required this.jangkaHidupHewanDatabase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              TinggiHewanBloc(tinggiHewanData, tinggiHewanDatabase)
                ..add(StartTinggiHewanEvent()),
        ),
        BlocProvider(
          create: (context) =>
              WaktuSejarahBloc(waktuSejarahData, waktuSejarahDatabase)
                ..add(StartWaktuSejarahEvent()),
        ),
        BlocProvider(
          create: (context) => JangkaHidupHewanBloc(
              jangkaHidupHewanData, jangkaHidupHewanDatabase)
            ..add(StartJangkaHidupHewanEvent()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        ),
        initialRoute: '/',
        onGenerateRoute: AppRouter().generateRoute,
        home: const Home(),
      ),
    );
  }
}
