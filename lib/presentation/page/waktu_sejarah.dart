import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scale_it/application/block_waktu_sejarah/waktu_sejarah_bloc.dart';
import 'package:scale_it/infrastructure/waktu_sejarah/highscore_database.dart';
import 'package:scale_it/presentation/widget/canvas.dart';
import 'package:scale_it/presentation/widget/pertanyaan.dart';
import '../widget/score.dart';

class WaktuSejarah extends StatelessWidget {
  const WaktuSejarah({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<WaktuSejarahBloc, WaktuSejarahState>(
      builder: (context, state) {
        if (state is WaktuSejarahLoaded) {
          return CanvasScreen(
              onTap: () {
                Navigator.of(context).pop();
                context.read<WaktuSejarahBloc>().add(ResetWaktuSejarahEvent());
              },
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: screenWidth * 0.41666,
                    top: screenHeight * 0.0285,
                    child: Text(
                      'Waktu Sejarah',
                      style: TextStyle(
                        fontFamily: 'AvantGarde_CE_Bold',
                        fontSize: screenWidth * 0.0208333,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Pertanyaan(
                            name: state.isWidget1Question
                                ? state.questionWaktuSejarah
                                : state.referenceWaktuSejarah,
                            subText: state.isWidget1Question
                                ? '?'
                                : state.referenceWaktuSejarah.year.toString(),
                            isCorrect: state.isWidget1Question,
                            showCorrectIndicator: state.showCorrectIndicator,
                            borderColor: state.isWidget1Question
                                ? state.borderColor
                                : Colors.black,
                          ),
                          SizedBox(
                            height: screenHeight * 0.04730369,
                          ),
                          Pertanyaan(
                            name: !state.isWidget1Question
                                ? state.questionWaktuSejarah
                                : state.referenceWaktuSejarah,
                            subText: !state.isWidget1Question
                                ? '?'
                                : state.referenceWaktuSejarah.year.toString(),
                            isCorrect: !state.isWidget1Question,
                            showCorrectIndicator: state.showCorrectIndicator,
                            borderColor: !state.isWidget1Question
                                ? state.borderColor
                                : Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth * 0.208333,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.0333),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(screenWidth * 0.00104166,
                                      screenHeight * 0.019),
                                  color: const Color(0xFFC04159),
                                ),
                                BoxShadow(
                                  offset: Offset(screenWidth * -0.00104166,
                                      screenHeight * 0.019),
                                  color: const Color(0xFFC04159),
                                )
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () => context
                                  .read<WaktuSejarahBloc>()
                                  .add(AnswerWaktuSejarahEvent('dahulu')),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFEA526F),
                                fixedSize: Size(screenWidth * 0.1890625,
                                    screenHeight * 0.0863104),
                              ),
                              child: Text(
                                'Lebih Dahulu',
                                style: TextStyle(
                                  fontFamily: 'AvantGarde_CE_Bold',
                                  fontSize: screenWidth * 0.020533,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.09463,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.0333),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(screenWidth * 0.00104166,
                                      screenHeight * 0.019),
                                  color: const Color(0xFF1C7CC5),
                                ),
                                BoxShadow(
                                  offset: Offset(screenWidth * -0.00104166,
                                      screenHeight * 0.019),
                                  color: const Color(0xFF1C7CC5),
                                )
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () => context
                                  .read<WaktuSejarahBloc>()
                                  .add(AnswerWaktuSejarahEvent('baru')),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF279AF1),
                                fixedSize: Size(screenWidth * 0.1890625,
                                    screenHeight * 0.0863104),
                              ),
                              child: Text(
                                'Lebih Baru',
                                style: TextStyle(
                                  fontFamily: 'AvantGarde_CE_Bold',
                                  fontSize: screenWidth * 0.020833,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Positioned(
                      top: screenHeight * 0.851466,
                      left: screenWidth * 0.4948,
                      child: SizedBox(
                        width: screenWidth * 0.0375,
                        height: screenHeight * 0.06814,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.02604166),
                          ),
                          child: Center(
                            child: Text(
                              state.score.toString(),
                              style: TextStyle(
                                fontSize: screenWidth * 0.020833,
                                fontFamily: 'AvantGarde_CE_Bold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ));
        } else if (state is WaktuSejarahGameOver) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _showGameOverDialog(context, state.finalScore);
          });
          return const SizedBox();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void _showGameOverDialog(BuildContext context, int score) {
    final database = WaktuSejarahHighScoreDatabase();
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withAlpha(110),
      builder: (context) {
        return Score(
          database: database,
          pageKey: 'waktu_sejarah',
          score: score,
        );
      },
    );
  }
}
