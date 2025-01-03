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
      return scores.first.score;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<TinggiHewanBloc, TinggiHewanState>(
      builder: (context, state) {
        return Material(
          color: Colors.transparent,
          child: SizedBox(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.0104166),
                child: SizedBox(
                  width: screenWidth * 0.2421875,
                  height: screenHeight * 0.65253,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.circular(screenWidth * 0.0104166),
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
                            icon: Image(
                              image: const AssetImage(
                                  'assets/images/arrow_back_putih.png'),
                              width: screenWidth * 0.03687,
                              height: screenHeight * 0.03,
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Skor : $score',
                                style: TextStyle(
                                  fontFamily: 'AvantGarde_LT',
                                  fontSize: screenWidth * 0.0333,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.0285,
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      screenWidth * 0.004166),
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
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(screenWidth * 0.1397,
                                        screenHeight * 0.054),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Image(
                                          image: const AssetImage(
                                              'assets/images/icon_main_lagi.png'),
                                          width: screenWidth * 0.0296875,
                                          height: screenHeight * 0.054,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          'Main Lagi',
                                          style: TextStyle(
                                            fontFamily: 'AvantGarde_LT',
                                            fontSize: (screenWidth < 1536)
                                                ? screenWidth * 0.010666
                                                : screenWidth * 0.016666,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: screenHeight * 0.5,
                          left: screenWidth * 0.078125,
                          child: FutureBuilder<int>(
                            future: _getHighScore(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text(
                                  'Memuat Rekor...',
                                  style: TextStyle(
                                    fontFamily: 'AvantGarde_LT',
                                    fontSize: screenWidth * 0.0125,
                                    color: Colors.white,
                                  ),
                                );
                              }
                              final highScore = snapshot.data ?? 0;
                              return Text(
                                'Rekor Kamu : $highScore',
                                style: TextStyle(
                                  fontFamily: 'AvantGarde_LT',
                                  fontSize: screenWidth * 0.0125,
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
