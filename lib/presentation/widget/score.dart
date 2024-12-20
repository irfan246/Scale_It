import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scale_it/application/bloc_jangka_hidup_hewan/jangka_hidup_hewan_bloc.dart';
import 'package:scale_it/application/bloc_tinggi_hewan/tinggi_hewan_bloc.dart';
import 'package:scale_it/application/block_waktu_sejarah/waktu_sejarah_bloc.dart';

class Score extends StatelessWidget {
  final int score;
  final String pageKey; // Kategori skor
  final database;

  const Score({
    super.key,
    required this.score,
    required this.pageKey,
    required this.database,
  });

  Future<int> _getHighScore() async {
    final scores = await database.getHighScores(pageKey);
    if (scores.isNotEmpty) {
      return scores.first.score; // Ambil skor tertinggi
    }
    return 0; // Jika tidak ada skor
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TinggiHewanBloc, TinggiHewanState>(
      builder: (context, state) {
        return Material(
          color: Colors.black.withAlpha(173),
          child: SizedBox(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: 465,
                  height: 584,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/pilihMode');
                              context
                                  .read<TinggiHewanBloc>()
                                  .add(ResetTinggiHewanEvent());
                              context
                                  .read<WaktuSejarahBloc>()
                                  .add(ResetWaktuSejarahEvent());
                            },
                            icon: const Image(
                              image: AssetImage(
                                  'assets/images/arrow_back_putih.png'),
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Skor : $score',
                                style: const TextStyle(
                                  fontFamily: 'AvantGarde_LT',
                                  fontSize: 64,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: 268,
                                height: 57,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      context
                                          .read<TinggiHewanBloc>()
                                          .add(ResetTinggiHewanEvent());
                                      context
                                          .read<WaktuSejarahBloc>()
                                          .add(ResetWaktuSejarahEvent());
                                      context
                                          .read<JangkaHidupHewanBloc>()
                                          .add(ResetJangkaHidupHewanEvent());
                                    },
                                    child: const Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/images/icon_main_lagi.png'),
                                        ),
                                        SizedBox(),
                                        Text(
                                          'Main Lagi',
                                          style: TextStyle(
                                            fontFamily: 'AvantGarde_LT',
                                            fontSize: 32,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 527,
                          left: 150,
                          child: FutureBuilder<int>(
                            future: _getHighScore(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Text(
                                  'Memuat Rekor...',
                                  style: TextStyle(
                                    fontFamily: 'AvantGarde_LT',
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                );
                              }
                              final highScore = snapshot.data ?? 0;
                              return Text(
                                'Rekor Kamu : $highScore',
                                style: const TextStyle(
                                  fontFamily: 'AvantGarde_LT',
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
