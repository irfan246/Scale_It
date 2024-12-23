import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scale_it/application/bloc_jangka_hidup_hewan/jangka_hidup_hewan_bloc.dart';
import 'package:scale_it/infrastructure/jangka_hidup_hewan/highscore_database.dart';
import 'package:scale_it/presentation/widget/canvas.dart';
import 'package:scale_it/presentation/widget/pertanyaan.dart';
import 'package:scale_it/presentation/widget/score.dart';

class JangkaHidupHewan extends StatelessWidget {
  const JangkaHidupHewan({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JangkaHidupHewanBloc, JangkaHidupHewanState>(
      builder: (context, state) {
        if (state is JangkaHidupHewanLoaded) {
          return CanvasScreen(
              onTap: () {
                Navigator.of(context).pop();
                context
                    .read<JangkaHidupHewanBloc>()
                    .add(ResetJangkaHidupHewanEvent());
              },
              child: Stack(
                children: <Widget>[
                  const Positioned(
                    left: 800,
                    top: 30,
                    child: Text(
                      'Jangka Hidup Hewan',
                      style: TextStyle(
                        fontFamily: 'AvantGarde_CE_Bold',
                        fontSize: 40,
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
                                ? state.questionJangkaHidupHewan
                                : state.referenceJangkaHidupHewan,
                            subText:
                                '${state.isWidget1Question ? '?' : state.referenceJangkaHidupHewan.year.toString()} tahun',
                            isCorrect: state.isWidget1Question,
                            showCorrectIndicator: state.showCorrectIndicator,
                            borderColor: state.isWidget1Question
                                ? state.borderColor
                                : Colors.black,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Pertanyaan(
                            name: !state.isWidget1Question
                                ? state.questionJangkaHidupHewan
                                : state.referenceJangkaHidupHewan,
                            subText:
                                '${!state.isWidget1Question ? '?' : state.referenceJangkaHidupHewan.year.toString()} tahun',
                            isCorrect: !state.isWidget1Question,
                            showCorrectIndicator: state.showCorrectIndicator,
                            borderColor: !state.isWidget1Question
                                ? state.borderColor
                                : Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 400,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(64),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(2, 20),
                                  color: Color(0xFFC04159),
                                ),
                                BoxShadow(
                                  offset: Offset(-2, 20),
                                  color: Color(0xFFC04159),
                                )
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () => context
                                  .read<JangkaHidupHewanBloc>()
                                  .add(AnswerJangkaHidupHewanEvent('panjang')),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFEA526F),
                                fixedSize: const Size(363, 94.74),
                              ),
                              child: const Text(
                                'Lebih Panjang',
                                style: TextStyle(
                                  fontFamily: 'AvantGarde_CE_Bold',
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(64),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(2, 20),
                                  color: Color(0xFF1C7CC5),
                                ),
                                BoxShadow(
                                  offset: Offset(-2, 20),
                                  color: Color(0xFF1C7CC5),
                                )
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () => context
                                  .read<JangkaHidupHewanBloc>()
                                  .add(AnswerJangkaHidupHewanEvent('pendek')),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF279AF1),
                                fixedSize: const Size(363, 94.74),
                              ),
                              child: const Text(
                                'Lebih Pendek',
                                style: TextStyle(
                                  fontFamily: 'AvantGarde_CE_Bold',
                                  fontSize: 40,
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
                      top: 900,
                      left: 950,
                      child: SizedBox(
                        width: 72,
                        height: 72,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              state.score.toString(),
                              style: const TextStyle(
                                fontSize: 40,
                                fontFamily: 'AvantGarde_CE_Bold',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ));
        } else if (state is JangkaHidupHewanGameOver) {
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
    final database = JangkaHidupHewanHighScoreDatabase();
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withAlpha(110),
      builder: (context) {
        return Score(
          database: database,
          pageKey: 'jangka_hidup_hewan',
          score: score,
        );
      },
    );
  }
}
