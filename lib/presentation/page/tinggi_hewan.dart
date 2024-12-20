import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scale_it/application/bloc_tinggi_hewan/tinggi_hewan_bloc.dart';
import 'package:scale_it/infrastructure/tinggi_hewan/highscore_database.dart';
import 'package:scale_it/presentation/widget/canvas.dart';
import 'package:scale_it/presentation/widget/pertanyaan.dart';
import 'package:scale_it/presentation/widget/score.dart';

class TinggiHewan extends StatelessWidget {
  const TinggiHewan({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TinggiHewanBloc, TinggiHewanState>(
      builder: (context, state) {
        if (state is TinggiHewanLoaded) {
          return CanvasScreen(
              onTap: () {
                Navigator.of(context).pop();
                context.read<TinggiHewanBloc>().add(ResetTinggiHewanEvent());
              },
              child: Stack(
                children: <Widget>[
                  const Positioned(
                    left: 800,
                    top: 30,
                    child: Text(
                      'Tinggi Hewan',
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
                        children: [
                          Pertanyaan(
                            name: state.isWidget1Question
                                ? state.questionAnimal
                                : state.referenceAnimal,
                            subText:
                                '${state.isWidget1Question ? '?' : state.referenceAnimal.height.toString()} cm',
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
                                ? state.questionAnimal
                                : state.referenceAnimal,
                            subText:
                                '${!state.isWidget1Question ? '?' : state.referenceAnimal.height.toString()} cm',
                            isCorrect: !state.isWidget1Question,
                            showCorrectIndicator: state.showCorrectIndicator,
                            borderColor: !state.isWidget1Question
                                ? state.borderColor
                                : Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 500,
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
                                  .read<TinggiHewanBloc>()
                                  .add(AnswerTinggiHewanEvent('tinggi')),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFEA526F),
                                fixedSize: const Size(363, 94.74),
                              ),
                              child: const Text(
                                'Lebih Tinggi',
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
                                  .read<TinggiHewanBloc>()
                                  .add(AnswerTinggiHewanEvent('rendah')),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF279AF1),
                                fixedSize: const Size(363, 94.74),
                              ),
                              child: const Text(
                                'Lebih Rendah',
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
        } else if (state is TinggiHewanGameOver) {
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
    final database = TinggiHewanHighScoreDatabase();
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Score(
          database: database,
          pageKey: 'tinggi_hewan',
          score: score,
        );
      },
    );
  }
}
